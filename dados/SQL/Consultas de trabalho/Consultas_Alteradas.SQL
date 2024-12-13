
# Consultas SQL Únicas e Alteradas

## Consulta: Base de Clientes com Representantes e Grupo


SELECT 
    CL.ClientId AS Id,
    CL.StoreName AS Name,
    CL.Address AS Address,
    CL.AddressNumber AS AddressNumber,
    CL.PostCode AS PostCode,
    CL.Town AS Town,
    CL.Region AS Region,
    RC.ClientRepresentativeId AS Representative,
    RG.GroupName AS Group,
    CL.BusinessCategory AS Category,
    CL.IdentificationNumber AS TaxId,
    CL.ContactEmail AS Email,
    CL.RegistrationDate AS RegistrationDate,
    CL.FormalName AS LegalName,
    CL.BusinessTypeId AS BusinessType
FROM 
    Clients CL
LEFT JOIN 
    RepresentativeClients RC 
    ON CL.ClientId = RC.ClientId
LEFT JOIN 
    RepresentativeGroups RG 
    ON RC.RepresentativeId = RG.GroupId;


## Consulta: Volume Transacionado por Dia


SELECT 
    CONVERT(varchar, CAST(tr.TransactionDate AS DATE), 103) AS TransactionDate,
    REPLACE(SUM(inst.GrossValue), '.', ',') AS GrossValue,
    COUNT(inst.GrossValue) AS TransactionCount,
    REPLACE(SUM(inst.NetValue), '.', ',') AS NetValue,
    REPLACE(SUM(inst.AdvancedValue), '.', ',') AS AdvancedValue
FROM Installments inst
INNER JOIN Transactions tr ON inst.TransactionId = tr.TransactionId
WHERE inst.StatusId IN (2,5,9)
      AND CAST(tr.TransactionDate AS DATE) BETWEEN '2024-09-01' AND '2024-09-30'
GROUP BY CAST(tr.TransactionDate AS DATE)
ORDER BY CAST(tr.TransactionDate AS DATE) ASC;


## Consulta: Enriquecida com Nome do MCC e Representantes


SELECT 
    CL.ClientId AS Id,
    CL.StoreName AS Name,
    CL.Address AS Address,
    CL.AddressNumber AS AddressNumber,
    CL.PostCode AS PostCode,
    CL.Town AS Town,
    CL.Region AS Region,
    REP.FullName AS Representative,
    GRP.GroupName AS Group,
    CL.BusinessCategory AS Category,
    CL.IdentificationNumber AS TaxId,
    MCC.Description AS BusinessType,
    REPLACE(SUM(inst.GrossValue), '.', ',') AS GrossValue,
    COUNT(inst.GrossValue) AS TransactionCount,
    REPLACE(SUM(inst.NetValue), '.', ',') AS NetValue,
    REPLACE(SUM(inst.AdvancedValue), '.', ',') AS AdvancedValue
FROM 
    Clients CL
LEFT JOIN 
    RepresentativeClients RC 
    ON CL.ClientId = RC.ClientId 
LEFT JOIN 
    RepresentativeGroups GRP 
    ON RC.RepresentativeId = GRP.GroupId
LEFT JOIN 
    Representatives REP 
    ON RC.RepresentativeId = REP.RepresentativeId
LEFT JOIN 
    MCC MCC
    ON CL.BusinessTypeId = MCC.BusinessTypeId
INNER JOIN 
    Transactions tr ON CL.ClientId = tr.ClientId
INNER JOIN 
    Installments inst ON tr.TransactionId = inst.TransactionId
WHERE 
    inst.StatusId IN (2,5,9)
    AND CAST(tr.TransactionDate AS DATE) BETWEEN '2024-08-01' AND '2024-08-31'
GROUP BY 
    CL.ClientId, CL.StoreName, CL.Address, CL.AddressNumber, CL.PostCode, CL.Town, CL.Region, 
    REP.FullName, GRP.GroupName, CL.BusinessCategory, CL.IdentificationNumber, MCC.Description
ORDER BY CL.StoreName ASC;


## Consulta: Documento Classificado (CPF/CNPJ)


SELECT 
    CL.ClientId AS Id,
    CL.StoreName AS Name,
    CL.Address AS Address,
    CL.AddressNumber AS AddressNumber,
    CL.PostCode AS PostCode,
    CL.Town AS Town,
    CL.Region AS Region,
    REP.FullName AS Representative,
    GRP.GroupName AS Group,
    CASE 
        WHEN LEN(CL.IdentificationNumber) = 11 THEN 'CPF'
        WHEN LEN(CL.IdentificationNumber) = 14 THEN 'CNPJ'
        ELSE 'Unknown'
    END AS DocumentType,
    MCC.Description AS BusinessType,
    REPLACE(SUM(inst.GrossValue), '.', ',') AS GrossValue,
    COUNT(inst.GrossValue) AS TransactionCount,
    REPLACE(SUM(inst.NetValue), '.', ',') AS NetValue,
    REPLACE(SUM(inst.AdvancedValue), '.', ',') AS AdvancedValue
FROM 
    Clients CL
LEFT JOIN 
    RepresentativeClients RC 
    ON CL.ClientId = RC.ClientId 
LEFT JOIN 
    RepresentativeGroups GRP 
    ON RC.RepresentativeId = GRP.GroupId
LEFT JOIN 
    Representatives REP 
    ON RC.RepresentativeId = REP.RepresentativeId
LEFT JOIN 
    MCC MCC
    ON CL.BusinessTypeId = MCC.BusinessTypeId
INNER JOIN 
    Transactions tr ON CL.ClientId = tr.ClientId
INNER JOIN 
    Installments inst ON tr.TransactionId = inst.TransactionId
WHERE 
    inst.StatusId IN (2,5,9)
    AND CAST(tr.TransactionDate AS DATE) BETWEEN '2024-08-01' AND '2024-08-31'
GROUP BY 
    CL.ClientId, CL.StoreName, CL.Address, CL.AddressNumber, CL.PostCode, CL.Town, CL.Region, 
    REP.FullName, GRP.GroupName, CL.IdentificationNumber, MCC.Description
ORDER BY CL.StoreName ASC;

