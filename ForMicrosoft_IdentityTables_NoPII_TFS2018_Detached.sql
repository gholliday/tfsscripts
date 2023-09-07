-- File: ForMicrosoft_IdentityTables_NoPII_TFS2018_Detached.sql
-- This script copies identity related tables from an on-premises environment into a new database that can be used for troubleshooting purposes.
-- Compatible with TFS2018
-- Run on DETACHED database. i.e. before starting data import migration
--
-- Instructions:
--   Make sure 'ForMicrosoftDetached2018' database does not exist before running this script.
--   Update database names to match customer's environment:
--     Tfs_DefaultCollection
--
CREATE DATABASE ForMicrosoftDetached2018
GO

-- Excluding [NamePart], [DisplayPart], [String], [IdentityDisplayName]
SELECT [PartitionId], [ConstID], [DomainPart], [fInTrustedDomain],  [ChangerID], [SID], [AddedDate], [RemovedDate],  [Cachestamp], [ProjectID], [TeamFoundationId], [fReferenced], [HasUniqueIdentityDisplayName] INTO ForMicrosoftDetached2018..Constants FROM Tfs_DefaultCollection..Constants

-- Not excluding anything 
SELECT [PartitionId], [localId], [masterId] INTO ForMicrosoftDetached2018..tbl_IdentityMap FROM Tfs_DefaultCollection..tbl_IdentityMap

-- Excluding [ProviderDisplayName], [DisplayName], [Description], [Domain], [AccountName], [DistinguishedName], [MailAddress], [Alias], [DirectoryAlias], [SocialIdentifier]
-- Excluding ADS2022 [SocialType]
SELECT [PartitionId], [Sid], [TypeId], [Id], [HasDisplayName], [IsGroup], [UniqueUserId], [LastSync], [SequenceId],  [Puid], [MetadataUpdateDate]  INTO ForMicrosoftDetached2018..tbl_Identity FROM Tfs_DefaultCollection..tbl_identity

-- Excluding [ConfirmedNotificationAddress], [CustomNotificationAddresses]
-- Excluding ADS2022 [DisambiguationDate], [ApplicationId] 
SELECT [PartitionId], [IdentityId], [ResourceVersion], [MetaTypeId], [ExternalId], [AuthenticationCredentialValidFrom], [ImageId], [ImageType],  [ChangeVersion] INTO ForMicrosoftDetached2018..tbl_IdentityExtension FROM Tfs_DefaultCollection..tbl_IdentityExtension

-- Not excluding anything
SELECT [PartitionId], [Id], [MasterId] INTO ForMicrosoftDetached2018..tbl_IdentityIdTranslation FROM Tfs_DefaultCollection..tbl_IdentityIdTranslation

-- Excluding [DisplayName], [Description]
SELECT [PartitionId], [Sid], [InternalScopeId], [Id], [SpecialType],  [RestrictedView], [ScopeLocal], [Active], [LastSync], [VirtualPlugin], [IsVirtual], [SequenceId] INTO ForMicrosoftDetached2018..tbl_Group FROM Tfs_DefaultCollection..tbl_Group

-- Not excluding anything
SELECT * INTO ForMicrosoftDetached2018..tbl_GroupAudit FROM Tfs_DefaultCollection..tbl_GroupAudit

-- Not excluding anything
SELECT [PartitionId], [ContainerId], [MemberId], [InactivatedTime], [Active], [SequenceId] INTO ForMicrosoftDetached2018..tbl_GroupMembership FROM Tfs_DefaultCollection..tbl_GroupMembership

-- Excluding [Name]
SELECT [PartitionId], [InternalScopeId], [ScopeId], [LocalScopeId], [ParentPath],  [SecuringHostId], [ScopeType], [Active] INTO ForMicrosoftDetached2018..tbl_GroupScope FROM Tfs_DefaultCollection..tbl_GroupScope

-- Not excluding anything
SELECT [PartitionId], [IdentityId], [InternalScopeId], [Active] INTO ForMicrosoftDetached2018..tbl_GroupScopeVisibility FROM Tfs_DefaultCollection..tbl_GroupScopeVisibility

