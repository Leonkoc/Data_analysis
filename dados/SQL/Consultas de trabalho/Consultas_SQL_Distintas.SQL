## Consulta 1: Transações por terminais com TPV e representantes
SELECT 
  cm.ClientId, 
  cm.MerchantName, 
  tr.FullName AS Representative, 
  trg.GroupName AS RepresentativeGroup,
  FORMAT(SUM(ISNULL(s.TransactionAmount, 0)), 'N', 'pt-BR') AS TPV,
  ISNULL(CAST(s.TransactionMonth AS VARCHAR(MAX)), 'Sem transações') AS Month,
  t.SerialCode
FROM CaptureTerminals cmt
LEFT JOIN (
  SELECT 
    s.TerminalId, 
    SUM(s.TransactionAmount) AS TransactionAmount, 
    MONTH(s.TransactionDate) AS TransactionMonth  
  FROM Transactions s
  WHERE s.TransactionDate BETWEEN '2024-05-01' AND '2024-06-30'
  GROUP BY s.TerminalId, MONTH(s.TransactionDate)
) s ON s.TerminalId = cmt.TerminalId
JOIN Devices t ON t.DeviceId = cmt.DeviceId
JOIN MerchantMethods mcm ON cmt.MethodId = mcm.MethodId AND mcm.IsActive = 1
JOIN Merchants cm ON cm.ClientId = mcm.ClientId 
LEFT JOIN RepresentativeClients trc ON trc.ClientId = cm.ClientId AND trc.EndDate IS NULL
LEFT JOIN Representatives tr ON tr.RepresentativeId = trc.RepresentativeId
LEFT JOIN RepresentativeGroups trg ON trg.GroupId = tr.GroupId
GROUP BY 
  t.SerialCode,
  cm.ClientId, 
  cm.MerchantName, 
  tr.FullName,
  s.TransactionMonth,
  trg.GroupName
ORDER BY t.SerialCode;


## Consulta 2: Resumo de transações com datas ajustadas
SELECT 
  DeviceId,
  SerialCode,
  ModelId,
  PlatformTypeId,
  CAST(SaleDate AS DATE) AS SaleDate,
  LastUpdate,
  StockDate
FROM Devices;


## Consulta 3: Inclusão do nome do modelo e tipo de plataforma
SELECT 
  d.DeviceId,
  d.SerialCode,
  tm.ModelName AS TerminalModelName,
  tp.PlatformName AS PlatformTypeName,
  CAST(d.SaleDate AS DATE) AS SaleDate,
  d.LastUpdate,
  d.StockDate
FROM Devices d
JOIN DeviceModels tm ON d.ModelId = tm.ModelId
JOIN Platforms tp ON d.PlatformTypeId = tp.PlatformTypeId;


## Consulta 4: Transações agrupadas por plataforma
SELECT 
  CONVERT(varchar, CAST(s.TransactionDate AS DATE), 103) AS TransactionDate,
  REPLACE(SUM(si.GrossValue), '.', ',') AS GrossValue,
  COUNT(si.GrossValue) AS TransactionCount,
  REPLACE(SUM(si.NetValue), '.', ',') AS NetValue,
  REPLACE(SUM(si.AdvancedValue), '.', ',') AS AdvancedValue,
  pt.PlatformName AS Platform
FROM Installments si
INNER JOIN Transactions s ON si.TransactionId = s.TransactionId
JOIN MerchantMethods mm ON s.MethodId = mm.MethodId
JOIN Platforms pt ON mm.PlatformTypeId = pt.PlatformTypeId
WHERE si.StatusId IN (2, 5, 9)
  AND CAST(s.TransactionDate AS DATE) BETWEEN CAST(DATEADD(day, -30, GETDATE()) AS DATE) AND CAST(GETDATE() AS DATE)
  AND pt.PlatformTypeId IN ('06ABCD20-C249-E611-80D7-0015C5E662EB', 
                             'EABBBE8A-9B05-4B1F-977C-47ED743390E4', 
                             '018DEBE4-06C1-4611-9CA1-EC27A2E03CF6')
GROUP BY CAST(s.TransactionDate AS DATE), pt.PlatformTypeId, pt.PlatformName
ORDER BY CAST(s.TransactionDate AS DATE) ASC;


## Consulta 5: Dados completos da tabela de comerciantes
SELECT 
  CM.ClientId AS Id,
  CM.MerchantName AS Name,
  CM.AddressLine AS Address,
  CM.AddressNumber AS AddressNumber,
  CM.PostalCode AS PostalCode,
  CM.City AS City,
  CM.State AS State,
  TRC.RepresentativeClientId AS Representative,
  TRG.GroupName AS GroupName,
  CM.BusinessCategory AS Category,
  CM.TaxId AS TaxId,
  CM.ContactEmail AS Email,
  CM.RegistrationDate AS RegistrationDate,
  CM.LegalName AS LegalName,
  CM.CompanyTypeId AS CompanyType
FROM Merchants CM
LEFT JOIN RepresentativeClients TRC ON CM.ClientId = TRC.ClientId
LEFT JOIN RepresentativeGroups TRG ON TRC.RepresentativeId = TRG.GroupId;

