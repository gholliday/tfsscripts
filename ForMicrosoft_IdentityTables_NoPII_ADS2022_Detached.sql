-- File: ForMicrosoft_IdentityTables_NoPII_ADS2022_Detached.sql
-- This script copies identity related tables from an on-premises environment into a new database that can be used for troubleshooting purposes.
-- Compatible with ADS2022
-- Run on DETACHED database. i.e. before starting data import migration
--
-- Instructions:
--   Make sure 'ForMicrosoftDetached' database does not exist before running this script.
--   Update database names to match customer's environment:
--     AzureDevOps_DefaultCollection
--
CREATE DATABASE ForMicrosoftDetached
GO

-- Excluding [NamePart], [DisplayPart], [String], [IdentityDisplayName]
SELECT [PartitionId], [ConstID], [DomainPart], [fInTrustedDomain],  [ChangerID], [SID], [AddedDate], [RemovedDate],  [Cachestamp], [ProjectID], [TeamFoundationId], [fReferenced], [HasUniqueIdentityDisplayName] INTO ForMicrosoftDetached..Constants FROM AzureDevOps_DefaultCollection..Constants

-- Not excluding anything 
SELECT [PartitionId], [localId], [masterId] INTO ForMicrosoftDetached..tbl_IdentityMap FROM AzureDevOps_DefaultCollection..tbl_IdentityMap

-- Excluding [ProviderDisplayName], [DisplayName], [Description], [Domain], [AccountName], [DistinguishedName], [MailAddress], [Alias], [DirectoryAlias], [SocialIdentifier]
SELECT [PartitionId], [Sid], [TypeId], [Id], [HasDisplayName], [IsGroup], [UniqueUserId], [LastSync], [SequenceId],  [Puid], [MetadataUpdateDate], [SocialType]  INTO ForMicrosoftDetached..tbl_Identity FROM AzureDevOps_DefaultCollection..tbl_identity

-- Excluding [ConfirmedNotificationAddress], [CustomNotificationAddresses]
SELECT [PartitionId], [IdentityId], [ResourceVersion], [MetaTypeId], [ExternalId], [AuthenticationCredentialValidFrom], [ImageId], [ImageType],  [ChangeVersion], [DisambiguationDate], [ApplicationId] INTO ForMicrosoftDetached..tbl_IdentityExtension FROM AzureDevOps_DefaultCollection..tbl_IdentityExtension

-- Not excluding anything
SELECT [PartitionId], [Id], [MasterId] INTO ForMicrosoftDetached..tbl_IdentityIdTranslation FROM AzureDevOps_DefaultCollection..tbl_IdentityIdTranslation

-- Excluding [DisplayName], [Description]
SELECT [PartitionId], [Sid], [InternalScopeId], [Id], [SpecialType],  [RestrictedView], [ScopeLocal], [Active], [LastSync], [VirtualPlugin], [IsVirtual], [SequenceId] INTO ForMicrosoftDetached..tbl_Group FROM AzureDevOps_DefaultCollection..tbl_Group

-- Not excluding anything
SELECT * INTO ForMicrosoftDetached..tbl_GroupAudit FROM AzureDevOps_DefaultCollection..tbl_GroupAudit

-- Not excluding anything
SELECT [PartitionId], [ContainerId], [MemberId], [InactivatedTime], [Active], [SequenceId] INTO ForMicrosoftDetached..tbl_GroupMembership FROM AzureDevOps_DefaultCollection..tbl_GroupMembership

-- Excluding [Name]
SELECT [PartitionId], [InternalScopeId], [ScopeId], [LocalScopeId], [ParentPath],  [SecuringHostId], [ScopeType], [Active] INTO ForMicrosoftDetached..tbl_GroupScope FROM AzureDevOps_DefaultCollection..tbl_GroupScope

-- Not excluding anything
SELECT [PartitionId], [IdentityId], [InternalScopeId], [Active] INTO ForMicrosoftDetached..tbl_GroupScopeVisibility FROM AzureDevOps_DefaultCollection..tbl_GroupScopeVisibility

