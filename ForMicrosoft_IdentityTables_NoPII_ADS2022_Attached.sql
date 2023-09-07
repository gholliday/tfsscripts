-- File: ForMicrosoft_IdentityTables_NoPII_ADS2022_Attached.sql
-- This script copies identity related tables from an on-premises environment into a new database that can be used for troubleshooting purposes.
-- Compatible with ADS2022
-- Run on ATTACHED database.
--
-- Instructions:
--   Make sure 'ForMicrosoftAttached' database does not exist before running this script.
--   Update database names to match customer's environment:
--     AzureDevOps_DefaultCollection
--     AzureDevOps_Configuration
CREATE DATABASE ForMicrosoftAttached
GO

-- Excluding [NamePart], [DisplayPart], [String], [SID], [IdentityDisplayName]
SELECT [PartitionId], [ConstID], [DomainPart], [fInTrustedDomain], [ChangerID], [AddedDate], [RemovedDate],  [Cachestamp], [ProjectID], [TeamFoundationId], [fReferenced], [HasUniqueIdentityDisplayName] INTO ForMicrosoftAttached..Constants FROM AzureDevOps_DefaultCollection..Constants

-- Not excluding anything 
SELECT [PartitionId], [localId], [masterId] INTO ForMicrosoftAttached..tbl_IdentityMap FROM AzureDevOps_DefaultCollection..tbl_IdentityMap


-- Excluding  [ProviderDisplayName], [DisplayName], [Description], [Domain], [AccountName], [DistinguishedName], [MailAddress], [Alias], [DirectoryAlias], [SocialIdentifier]
SELECT [PartitionId], [Sid], [TypeId], [Id], [HasDisplayName], [IsGroup], [UniqueUserId], [LastSync], [SequenceId],  [Puid], [MetadataUpdateDate], [SocialType]  INTO ForMicrosoftAttached..tbl_Identity FROM AzureDevOps_Configuration..tbl_identity

-- Excluding [ConfirmedNotificationAddress], [CustomNotificationAddresses]
SELECT [PartitionId], [IdentityId], [ResourceVersion], [MetaTypeId], [ExternalId], [AuthenticationCredentialValidFrom], [ImageId], [ImageType],  [ChangeVersion], [DisambiguationDate], [ApplicationId] INTO ForMicrosoftAttached..tbl_IdentityExtension FROM AzureDevOps_Configuration..tbl_IdentityExtension

-- Not excluding anything
SELECT [PartitionId], [Id], [MasterId] INTO ForMicrosoftAttached..tbl_IdentityIdTranslation FROM AzureDevOps_Configuration..tbl_IdentityIdTranslation

-- Excluding [DisplayName], [Description]
SELECT [PartitionId], [Sid], [InternalScopeId], [Id], [SpecialType],  [RestrictedView], [ScopeLocal], [Active], [LastSync], [VirtualPlugin], [IsVirtual], [SequenceId] INTO ForMicrosoftAttached..tbl_Group FROM AzureDevOps_Configuration..tbl_Group

-- Not excluding anything
SELECT * INTO ForMicrosoftAttached..tbl_GroupAudit FROM AzureDevOps_Configuration..tbl_GroupAudit

-- Not excluding anything
SELECT [PartitionId], [ContainerId], [MemberId], [InactivatedTime], [Active], [SequenceId] INTO ForMicrosoftAttached..tbl_GroupMembership FROM AzureDevOps_Configuration..tbl_GroupMembership

-- Excluding [Name]
SELECT [PartitionId], [InternalScopeId], [ScopeId], [LocalScopeId], [ParentPath],  [SecuringHostId], [ScopeType], [Active] INTO ForMicrosoftAttached..tbl_GroupScope FROM AzureDevOps_Configuration..tbl_GroupScope

-- Not excluding anything
SELECT [PartitionId], [IdentityId], [InternalScopeId], [Active] INTO ForMicrosoftAttached..tbl_GroupScopeVisibility FROM AzureDevOps_Configuration..tbl_GroupScopeVisibility

-- Not excluding anything
SELECT * INTO ForMicrosoftAttached..tbl_ServiceHost FROM AzureDevOps_Configuration..tbl_ServiceHost