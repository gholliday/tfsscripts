-- File: ForMicrosoft_IdentityTables.sql
-- This script copies identity related tables from an on-premises environment into a new database that can be used for troubleshooting purposes.
-- Compatible with TFS2018 and ADS2022
--
-- Instructions:
--   Make sure 'ForMicrosoft' database does not exist before running this script.
--   Update database names to match customer's environment:
--     AzureDevOps_Configuration 
--     AzureDevOps_DefaultCollection
CREATE DATABASE ForMicrosoft
GO

SELECT * INTO ForMicrosoft..ADObjects FROM AzureDevOps_DefaultCollection..ADObjects
SELECT * INTO ForMicrosoft..Constants FROM AzureDevOps_DefaultCollection..Constants
SELECT * INTO ForMicrosoft..ADObjectMemberships FROM AzureDevOps_DefaultCollection..ADObjectMemberships
SELECT * INTO ForMicrosoft..tbl_IdentityMap FROM AzureDevOps_DefaultCollection..tbl_IdentityMap
SELECT * INTO ForMicrosoft..tbl_SecurityAccessControlEntry FROM AzureDevOps_DefaultCollection..tbl_SecurityAccessControlEntry
SELECT * INTO ForMicrosoft..tbl_RegistryItems FROM AzureDevOps_DefaultCollection..tbl_RegistryItems

SELECT * INTO ForMicrosoft..Configuration_tbl_Identity FROM AzureDevOps_Configuration..tbl_identity
SELECT * INTO ForMicrosoft..Configuration_IdentityAudit FROM AzureDevOps_Configuration..tbl_IdentityAudit
SELECT * INTO ForMicrosoft..Configuration_tbl_IdentityExtension FROM AzureDevOps_Configuration..tbl_IdentityExtension
SELECT * INTO ForMicrosoft..Configuration_tbl_IdentityIdTranslation FROM AzureDevOps_Configuration..tbl_IdentityIdTranslation
SELECT * INTO ForMicrosoft..Configuration_tbl_Group FROM AzureDevOps_Configuration..tbl_Group
SELECT * INTO ForMicrosoft..Configuration_tbl_GroupAudit FROM AzureDevOps_Configuration..tbl_GroupAudit
SELECT * INTO ForMicrosoft..Configuration_tbl_GroupMembership FROM AzureDevOps_Configuration..tbl_GroupMembership
SELECT * INTO ForMicrosoft..Configuration_tbl_GroupScope FROM AzureDevOps_Configuration..tbl_GroupScope
SELECT * INTO ForMicrosoft..Configuration_tbl_GroupScopeVisibility FROM AzureDevOps_Configuration..tbl_GroupScopeVisibility
SELECT * INTO ForMicrosoft..Configuration_tbl_IdentitySyncQueue FROM AzureDevOps_Configuration..tbl_IdentitySyncQueue
SELECT * INTO ForMicrosoft..Configuration_tbl_ServiceHost FROM AzureDevOps_Configuration..tbl_ServiceHost
