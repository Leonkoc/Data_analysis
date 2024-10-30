import os
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import chart_studio.plotly as py
import plotly.graph_objs as go
import plotly.express as px
from plotly.offline import init_notebook_mode

# Inicialização do modo offline para plotly
init_notebook_mode(connected=True)

# Carregar dados
dataset_path = r"C:\Users\bruna\OneDrive\Documentos\Case_py\Uber\Datasets"
uber_15 = pd.read_csv(f"{dataset_path}\uber-raw-data-janjune-15_sample.csv")

# Informações iniciais do dataset
print(uber_15.shape)
print(uber_15.head())
print(uber_15.columns)
print(uber_15.dtypes)

# Remover duplicados
uber_15.drop_duplicates(inplace=True)

# Verificar valores nulos e converter data para datetime
uber_15['Pickup_date'] = pd.to_datetime(uber_15['Pickup_date'])
uber_15['month'] = uber_15['Pickup_date'].dt.month_name()

# Análise de frequência por mês
uber_15['month'].value_counts().plot(kind='bar')

# Extração de dia e hora
uber_15['weekday'] = uber_15['Pickup_date'].dt.day_name()
uber_15['day'] = uber_15['Pickup_date'].dt.day
uber_15['hour'] = uber_15['Pickup_date'].dt.hour

# Crosstab por mês e dia da semana
pivot = pd.crosstab(index=uber_15['month'], columns=uber_15['weekday'])
pivot.plot(kind='bar', figsize=(8, 6))

# Análise por dia da semana e hora
race_per_hour = uber_15.groupby(['weekday', 'hour']).size().reset_index(name='size')
sns.pointplot(x='hour', y='size', hue='weekday', data=race_per_hour)

# Carregar dados adicionais e mesclar
uber_vehicles = pd.read_csv(f"{dataset_path}\Uber-Jan-Feb-FOIL.csv")
px.box(x='dispatching_base_number', y='active_vehicles', data_frame=uber_vehicles)

# Consolidar múltiplos arquivos de dados
files = [file for file in os.listdir(dataset_path) if file not in ['uber-raw-data-janjune-15.csv', 'uber-raw-data-janjune-15_sample.csv']]
final_df = pd.DataFrame()

for file in files:
    current_df = pd.read_csv(f"{dataset_path}/{file}")
    final_df = pd.concat([final_df, current_df])

# Limpeza e tratamento de dados no dataframe consolidado
final_df.drop_duplicates(inplace=True)
final_df['Date/Time'] = pd.to_datetime(final_df['Date/Time'], format='%m/%d/%Y %H:%M:%S')
final_df['day'] = final_df['Date/Time'].dt.day
final_df['hour'] = final_df['Date/Time'].dt.hour

# Geração de mapa de calor com folium
import folium
from folium.plugins import HeatMap

rush_uber = final_df.groupby(['Lat', 'Lon']).size().reset_index(name='size')
base_map = folium.Map()
HeatMap(rush_uber[['Lat', 'Lon', 'size']].values.tolist()).add_to(base_map)

# Função para geração de tabela dinâmica
def gen_pivot_table(df, col1, col2):
    pivot_table = df.groupby([col1, col2]).size().unstack()
    return pivot_table.style.background_gradient(cmap='Blues')

# Exemplo de uso da função
pivot_day_hour = gen_pivot_table(final_df, 'day', 'hour')
print(pivot_day_hour)
