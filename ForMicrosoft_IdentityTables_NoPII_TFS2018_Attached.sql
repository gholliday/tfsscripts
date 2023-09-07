-- File: ForMicrosoft_IdentityTables_NoPII_TFS2018_Attached.sql
-- This script copies identity related tables from an on-premises environment into a new database that can be used for troubleshooting purposes.
-- Compatible with TFS2018
-- Run on ATTACHED database.
--
-- Instructions:
--   Make sure 'ForMicrosoftAttachedTFS2018' database does not exist before running this script.
--   Update database names to match customer's environment:
--     AzureDevOps_DefaultCollection
--     AzureDevOps_Configuration
CREATE DATABASE ForMicrosoftAttachedTFS2018
GO

-- Excluding [NamePart], [DisplayPart], [String], [SID], [IdentityDisplayName]
SELECT [PartitionId], [ConstID], [DomainPart], [fInTrustedDomain], [ChangerID], [AddedDate], [RemovedDate],  [Cachestamp], [ProjectID], [TeamFoundationId], [fReferenced], [HasUniqueIdentityDisplayName] INTO ForMicrosoftAttachedTFS2018..Constants FROM AzureDevOps_DefaultCollection..Constants

-- Not excluding anything 
SELECT [PartitionId], [localId], [masterId] INTO ForMicrosoftAttachedTFS2018..tbl_IdentityMap FROM AzureDevOps_DefaultCollection..tbl_IdentityMap


-- Excluding  [ProviderDisplayName], [DisplayName], [Description], [Domain], [AccountName], [DistinguishedName], [MailAddress], [Alias], [DirectoryAlias], [SocialIdentifier]
-- Excluding ADS2022 [SocialType] 
SELECT [PartitionId], [Sid], [TypeId], [Id], [HasDisplayName], [IsGroup], [UniqueUserId], [LastSync], [SequenceId],  [Puid], [MetadataUpdateDate] INTO ForMicrosoftAttachedTFS2018..tbl_Identity FROM AzureDevOps_Configuration..tbl_identity

-- Excluding [ConfirmedNotificationAddress], [CustomNotificationAddresses]
-- Excluding ADS2022 [DisambiguationDate], [ApplicationId]
SELECT [PartitionId], [IdentityId], [ResourceVersion], [MetaTypeId], [ExternalId], [AuthenticationCredentialValidFrom], [ImageId], [ImageType],  [ChangeVersion] INTO ForMicrosoftAttachedTFS2018..tbl_IdentityExtension FROM AzureDevOps_Configuration..tbl_IdentityExtension

-- Not excluding anything
SELECT [PartitionId], [Id], [MasterId] INTO ForMicrosoftAttachedTFS2018..tbl_IdentityIdTranslation FROM AzureDevOps_Configuration..tbl_IdentityIdTranslation

-- Excluding [DisplayName], [Description]
SELECT [PartitionId], [Sid], [InternalScopeId], [Id], [SpecialType],  [RestrictedView], [ScopeLocal], [Active], [LastSync], [VirtualPlugin], [IsVirtual], [SequenceId] INTO ForMicrosoftAttachedTFS2018..tbl_Group FROM AzureDevOps_Configuration..tbl_Group

-- Not excluding anything
SELECT * INTO ForMicrosoftAttachedTFS2018..tbl_GroupAudit FROM AzureDevOps_Configuration..tbl_GroupAudit

-- Not excluding anything
SELECT [PartitionId], [ContainerId], [MemberId], [InactivatedTime], [Active], [SequenceId] INTO ForMicrosoftAttachedTFS2018..tbl_GroupMembership FROM AzureDevOps_Configuration..tbl_GroupMembership

-- Excluding [Name]
SELECT [PartitionId], [InternalScopeId], [ScopeId], [LocalScopeId], [ParentPath],  [SecuringHostId], [ScopeType], [Active] INTO ForMicrosoftAttachedTFS2018..tbl_GroupScope FROM AzureDevOps_Configuration..tbl_GroupScope

-- Not excluding anything
SELECT [PartitionId], [IdentityId], [InternalScopeId], [Active] INTO ForMicrosoftAttachedTFS2018..tbl_GroupScopeVisibility FROM AzureDevOps_Configuration..tbl_GroupScopeVisibility

-- Not excluding anything
SELECT * INTO ForMicrosoftAttachedTFS2018..tbl_ServiceHost FROM AzureDevOps_Configuration..tbl_ServiceHost