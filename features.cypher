CREATE (Database:Feature {title: "Database"})
CREATE (Docker:Feature {title: 'Docker'})
CREATE (JAR:Feature {title: 'JAR'})
CREATE (EnvVar:Feature {title: 'Environment Variable'})

CREATE (Logging:Feature {title: 'Logging'})
CREATE (API:Feature {title: 'API'})

CREATE (Geocoding:Login {title: 'Geocoding'})
CREATE
(Geocoding)-[:CAN_BE_SET_FROM]->(EnvVar)

CREATE (Session:Login {title: 'Session'})
CREATE (SessionTimeout:LoginSetting {title: 'Session Timeout setting'})
CREATE (SessionToken:Session {title: 'Session Token that gets created when someone logs in'})
CREATE (EmbeddedSessionToken:Session {title: 'Session Token that gets created when someone logs in via an embedding'})

CREATE
(Session)-[:HAS]->(SessionTimeout),
(Session)-[:HAS]->(Geocoding),
(SessionTimeout)-[:CAN_BE_SET_FROM]->(EnvVar)

CREATE (EmailAttribute:LoginSetting {title: 'Email Attribute setting'})
CREATE (FirstNameAttribute:LoginSetting {title: 'First name Attribute setting'})
CREATE (LastNameAttribute:LoginSetting {title: 'First name Attribute setting'})
CREATE (GroupName:LoginSetting {title: 'Group name to search for setting'})
CREATE (GroupMapping:LoginSetting {title: 'Group Mapping setting'})
CREATE
(GroupMapping)-[:CAN_BE_SET_FROM]->(EnvVar),
(GroupMapping)-[:HAS]->(EmailAttribute),
(GroupMapping)-[:HAS]->(FirstNameAttribute),
(GroupMapping)-[:HAS]->(LastNameAttribute)

CREATE (OAuth:Login {title: 'OAuth SSO'})
CREATE (OAuthClientId:LoginSetting {title: 'OAuth Client ID setting'})
CREATE (OAuthDomain:LoginSetting {title: 'OAuth Domain setting'})
CREATE
(OAuth)-[:HAS]->(OAuthClientId),
(OAuth)-[:HAS]->(OAuthDomain),
(OAuthClientId)-[:CAN_BE_SET_FROM]->(EnvVar),
(OAuthDomain)-[:CAN_BE_SET_FROM]->(EnvVar)


CREATE (LDAP:Login {title: 'LDAP SSO'})
CREATE (LDAPHostname:LoginSetting {title: 'LDAP Hostname setting'})
CREATE (LDAPPort:LoginSetting {title: 'LDAP Port setting'})
CREATE (LDAPSecurity:LoginSetting {title: 'LDAP Security setting'})
CREATE (LDAPUsername:LoginSetting {title: 'LDAP Username setting'})
CREATE (LDAPPassword:LoginSetting {title: 'LDAP Password setting'})
CREATE (LDAPSearchBase:LoginSetting {title: 'LDAP Search Base setting'})
CREATE (LDAPUserFilter:LoginSetting {title: 'LDAP User Filter setting'})
CREATE
(LDAP)-[:HAS]->(LDAPHost),
(LDAP)-[:HAS]->(LDAPPort),
(LDAP)-[:HAS]->(LDAPSecurity),
(LDAP)-[:HAS]->(LDAPUsername),
(LDAP)-[:HAS]->(LDAPPassword),
(LDAP)-[:HAS]->(LDAPUserFilter),
(LDAP)-[:HAS]->(LDAPGroupFilter),
(LDAPHost)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAPPort)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAPSecurity)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAPUsername)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAPPassword)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAPUserFilter)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAPGroupFilter)-[:CAN_BE_SET_FROM]->(EnvVar),
(LDAP)-[:HAS]->(GroupMapping)

CREATE (SAML:Login {title: 'SAML SSO'})
CREATE (SAMLIdpURL:LoginSetting {title: 'SAML IDP URL setting'})
CREATE (SAMLIdpCert:LoginSetting {title: 'SAML IDP Cert setting'})
CREATE (SAMLIdpIssuer:LoginSetting {title: 'SAML IDP Issuer setting'})
CREATE (SAMLApplicationName:LoginSetting {title: 'SAML Application Name setting'})
CREATE (SAMLKeyStorePath:LoginSetting {title: 'SAML Key Store Path setting'})
CREATE (SAMLKeyStorePassword:LoginSetting {title: 'SAML Key Store Password setting'})
CREATE (SAMLKeyAlias:LoginSetting {title: 'SAML Key Alias setting'})
CREATE
(SAML)-[:HAS]->(SAMLIdpURL),
(SAML)-[:HAS]->(SAMLIdpCert),
(SAML)-[:HAS]->(SAMLIdpIssuer),
(SAML)-[:HAS]->(SAMLApplicationName),
(SAML)-[:HAS]->(SAMLKeyStorePath),
(SAML)-[:HAS]->(SAMLKeyStorePassword),
(SAML)-[:HAS]->(SAMLKeyAlias),
(SAMLIdpURL)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAMLIdpCert)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAMLIdpIssuer)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAMLApplicationName)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAMLKeyStorePath)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAMLKeyStorePassword)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAMLKeyAlias)-[:CAN_BE_SET_FROM]->(EnvVar),
(SAML)-[:HAS]->(GroupMapping)

CREATE (JWT:Login {title: 'JWT SSO'})
CREATE (JWTURL:LoginSetting {title: 'JWT URL setting'})
CREATE (JWTSecret:LoginSetting {title: 'JWT Secret setting'})
CREATE
(JWT)-[:HAS]->(JWTURL),
(JWT)-[:HAS]->(JWTSecret),
(JWTURL)-[:CAN_BE_SET_FROM]->(EnvVar),
(JWTSecret)-[:CAN_BE_SET_FROM]->(EnvVar),
(JWT)-[:HAS]->(GroupMapping)

CREATE (Basic:Login {title: 'Username and Password login'})

CREATE (Login:Feature {title: 'Login'})
CREATE
(Login)-[:CAN_BE]->(Basic),
(Login)-[:CAN_BE]->(JWT),
(Login)-[:CAN_BE]->(SAML),
(Login)-[:CAN_BE]->(LDAP),
(Login)-[:CAN_BE]->(OAuth),
(Login)-[:CREATES]->(Session),
(Session)-[:CREATES]->(SessionToken)

CREATE (Whitelabelling:Feature {title: 'Whitelabelling'})

CREATE (Language:Feature {title: 'Language'})
CREATE (InstanceLanguage:InstanceSetting {title: 'Instance Language setting'})
CREATE (ReportTimezone:InstanceSetting {title: 'Report Timezone setting'})
CREATE (FirstDayOfWeek:InstanceSetting {title: 'First Day of Week setting'})
CREATE (DateFormat:InstanceSetting {title: 'Date Format setting'})
CREATE (DateSeparator:InstanceSetting {title: 'Date Separator setting'})
CREATE (TimeFormat:InstanceSetting {title: 'Time Format setting'})
CREATE (AbbreviateDate:InstanceSetting {title: 'Abbreviate Date setting'})
CREATE (SeparatorStyle:InstanceSetting {title: 'Separator Style setting'})
CREATE (CurrencySymbol:InstanceSetting {title: 'Currency Symbol setting'})
CREATE (CurrencyLabelStyle:InstanceSetting {title: 'Currency Label Style setting'})
CREATE (CurrencyDisplay:InstanceSetting {title: 'Currency Display setting'})
CREATE
(InstanceLanguage)-[:CAN_BE_SET_FROM]->(EnvVar),
(ReportTimezone)-[:CAN_BE_SET_FROM]->(EnvVar),
(FirstDayOfWeek)-[:CAN_BE_SET_FROM]->(EnvVar),
(DateFormat)-[:CAN_BE_SET_FROM]->(EnvVar),
(DateSeparator)-[:CAN_BE_SET_FROM]->(EnvVar),
(TimeFormat)-[:CAN_BE_SET_FROM]->(EnvVar),
(AbbreviateDate)-[:CAN_BE_SET_FROM]->(EnvVar),
(SeparatorStyle)-[:CAN_BE_SET_FROM]->(EnvVar),
(CurrencySymbol)-[:CAN_BE_SET_FROM]->(EnvVar),
(CurrencyLabelStyle)-[:CAN_BE_SET_FROM]->(EnvVar),
(CurrencyDisplay)-[:CAN_BE_SET_FROM]->(EnvVar),
(InstanceLanguage)-[:HAS]->(Language)

CREATE (Question:Feature {title: 'Question'})

CREATE (SignedEmbedding:Feature {title: 'Signed Embedding Feature'})
CREATE (EmbeddingSecretKey:EmbeddingSetting {title: 'Embedding Secret Key setting'})
CREATE (EmbeddingParameter:EmbeddingSetting {title: 'Embedding Parameter setting'})
CREATE
(EmbeddingSecretKey)-[:CAN_BE_SET_FROM]->(EnvVar)

CREATE (FullAppEmbedding:Feature {title: 'Full App Embedding feature'})
CREATE (AuthorizedOrigins:EmbeddingSetting {title: 'Authorized Origins setting'})

CREATE (Border:EmbeddingStyleSetting {title: 'Border setting'})
CREATE (Title:UIComponent {title: 'Title'})
CREATE (Theme:EmbeddingStyleSetting {title: 'Theme setting'})
CREATE (Font:Setting {title: 'Font setting'})
CREATE (DownloadData:EmbeddingStyleSetting {title: 'Download Data setting'})

CREATE (PostMessage:EmbeddingFeatureSetting {title: 'postMessage setting'})
CREATE (LocationFrom:PostMessageType {title: 'location postmessage config'})
CREATE (LocationTo:PostMessageType {title: 'location postmessage config'})
CREATE (FrameMode:PostMessageType {title: 'frame mode postmessage config'})
CREATE (FrameType:PostMessageType {title: 'frame type postmessage config'})
CREATE
(PostMessage)-[:CAN_BE]->(LocationFrom),
(PostMessage)-[:CAN_BE]->(LocationTo),
(PostMessage)-[:CAN_BE]->(FrameMode),
(PostMessage)-[:CAN_BE]->(FrameType)
CREATE (ActionButtons:UIComponent {title: 'Action Button'})
CREATE (AdditionalInfo:UIComponent {title: 'Additional Info'})
CREATE (Breadcrumb:UIComponent {title: 'Embedding Breadcrumb'})
CREATE (Header:UIComponent {title: 'Embedding Header'})
CREATE (Logo:UIComponent {title: 'Logo'})
CREATE (NewButton:UIComponent {title: 'New Button'})
CREATE (Search:UIComponent {title: 'Search'})
CREATE (SideNav:UIComponent {title: 'Side Nav'})
CREATE (TopNav:UIComponent {title: 'Top Nav'})
CREATE (FullAppEmbeddingStyling:EmbeddingStyleSetting {title: 'Full App Embedding Styling setting'})

CREATE (SimpleEmbeddedQuestion:EmbeddedQuestionType {title: 'Simple Embedded Question'})

CREATE (Dashboard:Feature {title: 'Dashboard'})
CREATE (SimpleEmbeddedDashboard:DashboardType {title: 'Simple Embedded Dashboard'})
CREATE (Model:QuestionType {title: 'Model'})
CREATE
(Dashboard)-[:HAS]->(Question),
(Question)-[:CAN_BE]->(Model)

CREATE (GUIQuestion:QuestionType {title: 'GUI Question'})
CREATE (NativeQuestion:QuestionType {title: 'Native Question'})
CREATE
(Question)-[:CAN_BE]->(GUIQuestion),
(GUIQuestion)-[:HAS]->(ReportTimezone),
(Question)-[:CAN_BE]->(NativeQuestion)


CREATE (Embedding:Feature {title: 'Embedding'})
CREATE (EmbeddingLanguage:EmbeddingSetting {title: 'Embedding Language setting'})

CREATE
(Embedding)-[:CAN_BE]->(FullAppEmbedding),
(Embedding)-[:CAN_BE]->(SignedEmbedding),

(SignedEmbedding)-[:HAS]->(EmbeddingSecretKey),
(SignedEmbedding)-[:HAS]->(EmbeddingParameter),
(SignedEmbedding)-[:CAN_EMBED]->(SimpleEmbeddedQuestion),
(SignedEmbedding)-[:CAN_EMBED]->(SimpleEmbeddedDashboard),
(SimpleEmbeddedDashboard)-[:HAS]->(Border),
(SimpleEmbeddedQuestion)-[:HAS]->(Border),
(SimpleEmbeddedDashboard)-[:HAS]->(Title),
(SimpleEmbeddedQuestion)-[:HAS]->(Title),
(SimpleEmbeddedDashboard)-[:HAS]->(Theme),
(SimpleEmbeddedQuestion)-[:HAS]->(Theme),
(SimpleEmbeddedDashboard)-[:HAS]->(Font),
(SimpleEmbeddedQuestion)-[:HAS]->(Font),
(SimpleEmbeddedDashboard)-[:HAS]->(DownloadData),
(SimpleEmbeddedQuestion)-[:HAS]->(DownloadData),

(FullAppEmbedding)-[:HAS]->(PostMessage),
(FullAppEmbedding)-[:HAS]->(FullAppEmbeddingStyling),
(FullAppEmbeddingStyling)-[:HAS]->(ActionButtons),
(FullAppEmbeddingStyling)-[:HAS]->(AdditionalInfo),
(FullAppEmbeddingStyling)-[:HAS]->(Breadcrumb),
(FullAppEmbeddingStyling)-[:HAS]->(Header),
(FullAppEmbeddingStyling)-[:HAS]->(Logo),
(FullAppEmbeddingStyling)-[:HAS]->(NewButton),
(FullAppEmbeddingStyling)-[:HAS]->(Search),
(FullAppEmbeddingStyling)-[:HAS]->(SideNav),
(FullAppEmbeddingStyling)-[:HAS]->(TopNav),
(FullAppEmbedding)-[:CAN_EMBED]->(Question),
(FullAppEmbedding)-[:CAN_EMBED]->(Dashboard),
(FullAppEmbedding)-[:HAS]->(AuthorizedOrigins),
(FullAppEmbedding)-[:HAS]->(EmbeddingLanguage),
(EmbeddingLanguage)-[:IS]->(Language),
(FullAppEmbedding)-[:CAN_BE {type: 'authentication'}]->(SAML),
(FullAppEmbedding)-[:CAN_BE {type: 'authentication'}]->(Basic),
(FullAppEmbedding)-[:CAN_BE {type: 'authentication'}]->(JWT),
(FullAppEmbedding)-[:CAN_BE {type: 'authentication'}]->(OAuth),
(FullAppEmbedding)-[:CAN_BE {type: 'authentication'}]->(LDAP),
(FullAppEmbedding)-[:CREATES]->(EmbeddedSessionToken)

CREATE (CSV:ExportType {title: 'CSV export'})
CREATE (XLSX:ExportType {title: 'XLSX export'})
CREATE (JSON:ExportType {title: 'JSON export'})

CREATE (PublicSharing:Feature {title: 'Public Sharing'})
CREATE (PublicSharingEnabled:InstanceSetting {title: 'Public Sharing Enabled setting'})
CREATE (PublicLink:SharingType {title: 'Public Link'})
CREATE 
(PublicSharing)-[:HAS]->(PublicSharingEnabled),
(PublicSharing)-[:HAS]->(PublicLink),
(PublicSharingEnabled)-[:CAN_BE_SET_FROM]->(EnvVar),
(Embedding)-[:CAN_BE]->(PublicSharing),
(Question)-[:CAN_BE]->(PublicSharing),
(Question)-[:CAN_HAVE]->(PublicLink),
(Dashboard)-[:CAN_BE]->(PublicSharing),
(Dashboard)-[:CAN_HAVE]->(PublicLink),
(PublicLink)-[:CAN_BE]->(CSV),
(PublicLink)-[:CAN_BE]->(XLSX),
(PublicLink)-[:CAN_BE]->(JSON)


CREATE (PremiumToken:Setting {title: 'Premium Token'})
CREATE (PremiumToken)-[:CAN_BE_SET_FROM]->(EnvVar)

CREATE (Caching:Feature {title: 'Caching'})
CREATE (QuestionCaching:CachingType {title: 'Question Caching'})
CREATE (MinimumQueryDuration:CachingSetting {title: 'Minimum Query Duration setting'})
CREATE (CacheTTL:CachingSetting {title: 'Cache TTL setting'})
CREATE (CacheSize:CachingSetting {title: 'Cache Size setting'})
CREATE (DashboardCaching:CachingType {title: 'Dashboard Caching'})
CREATE (CachingDuration:CachingSetting {title: 'Cache Duration setting'})
CREATE
(MinimumQueryDuration)-[:CAN_BE_SET_FROM]->(EnvVar),
(CacheTTL)-[:CAN_BE_SET_FROM]->(EnvVar),
(CacheSize)-[:CAN_BE_SET_FROM]->(EnvVar),
(QuestionCaching)-[:HAS]->(MinimumQueryDuration),
(QuestionCaching)-[:HAS]->(CacheTTL),
(QuestionCaching)-[:HAS]->(CacheSize)

CREATE (ModelCaching:CachingType {title: 'Model Caching'})
CREATE (ModelRefreshInterval:CachingSetting {title: 'Model Refresh Interval setting'})
CREATE
(ModelRefreshInterval)-[:CAN_BE_SET_FROM]->(EnvVar),
(ModelCaching)-[:HAS]->(ModelRefreshInterval),
(Model)-[:CAN_BE_CACHED]->(ModelCaching)

CREATE 
(Caching)-[:CAN_BE]->(QuestionCaching),
(Caching)-[:CAN_BE]->(ModelCaching),
(Question)-[:CAN_BE_CACHED]->(QuestionCaching),
(Dashboard)-[:CAN_BE_CACHED]->(DashboardCaching),
(DashboardCaching)-[:HAS]->(CachingDuration)

CREATE (Collections:Feature {title: 'Collections'})
CREATE (Personal:Collection {title: 'Personal'})
CREATE (Collection:Collection {title: 'Collection'})
CREATE (NormalCollection:CollectionType {title: 'NormalCollection'})
CREATE (OfficialCollection:CollectionType {title: 'OfficialCollection'})
CREATE (Archive:Collection {title: 'Archive'})
CREATE (View:CollectionPermission {title: 'View collection permissions'})
CREATE (Curate:CollectionPermission {title: 'Curate collection permissions'})
CREATE
(Collection)-[:CAN_BE]->(NormalCollection),
(Collection)-[:CAN_BE]->(OfficialCollection),
(Collection)-[:PERMISSION]->(View),
(Collection)-[:PERMISSION]->(Curate),
(Collection)-[:CAN_HAVE]->(Question),
(Collection)-[:CAN_HAVE]->(Dashboard)

CREATE (User:Feature {title: 'User'})
CREATE (UserLanguage:UserSetting {title: 'User Language setting'})
CREATE (Attributes:User {title: 'Attributes'})
CREATE
(User)-[:CAN_HAVE]->(UserLanguage),
(User)-[:CAN_HAVE]->(Attributes),
(User)-[:CAN_AUTHENTICATE]->(Basic),
(User)-[:CAN_AUTHENTICATE]->(OAuth),
(User)-[:CAN_AUTHENTICATE]->(LDAP),
(User)-[:CAN_AUTHENTICATE]->(SAML),
(User)-[:CAN_AUTHENTICATE]->(JWT)

CREATE (Group:Feature {title: 'Group'})
CREATE (GroupManager:RoleType {title: 'Group Manager role'})
CREATE (NormalGroup:GroupType {title: 'Normal Group'})
CREATE (SpecialGroup:GroupType {title: 'Special Group'})
CREATE (AllUsers:SpecialGroupType {title: 'All Users group'})
CREATE (AdminGroup:SpecialGroupType {title: 'Admin group'})
CREATE
(User)-[:CAN_BE]->(GroupManager),
(Group)-[:CAN_BE]->(NormalGroup),
(Group)-[:CAN_BE]->(SpecialGroup),
(AdminGroup)-[:IS]->(SpecialGroup),
(AdminGroup)-[:CAN_SET]->(Attributes),
(AllUsers)-[:IS]->(NormalGroup)

CREATE (NoSelfService:DataPermission {title: 'No Self-Service permission'})
CREATE (Block:DataPermission {title: 'Block permission'})
CREATE (Sandboxed:DataPermission {title: 'Sandboxed permission'})
CREATE (Granular:DataPermission {title: 'Granular permission'})
CREATE (Unrestricted:DataPermission {title: 'Unrestricted permission'})
CREATE (SQL:DataPermission {title: 'SQL permission'})
CREATE (Download:DataPermission {title: 'Download permission'})
CREATE (ManageModel:DataPermission {title: 'Manage Model permission'})
CREATE (ManageDatabase:DataPermission {title: 'Manage Database permission'})
CREATE (SettingsAccess:AppPermission {title: 'Settings Access permission'})
CREATE (MonitoringAccess:AppPermission {title: 'Monitoring Access permission'})
CREATE (SubscriptionsAlerts:AppPermission {title: 'Subscriptions and Alerts permission'})
CREATE 
(NormalGroup)-[:PERMISSION]->(NoSelfService),
(NormalGroup)-[:PERMISSION]->(Block),
(NormalGroup)-[:PERMISSION]->(Sandboxed),
(NormalGroup)-[:PERMISSION]->(Granular),
(NormalGroup)-[:PERMISSION]->(Unrestricted),
(NormalGroup)-[:PERMISSION]->(SQL),
(NormalGroup)-[:PERMISSION]->(Download),
(NormalGroup)-[:PERMISSION]->(ManageModel),
(NormalGroup)-[:PERMISSION]->(ManageDatabase),
(NormalGroup)-[:PERMISSION]->(SettingsAccess),
(NormalGroup)-[:PERMISSION]->(MonitoringAccess),
(NormalGroup)-[:PERMISSION]->(SubscriptionsAlerts)

CREATE (SiteName:Setting {title: 'Site Name'})
CREATE (SiteURL:Setting {title: 'Site URL'})
CREATE (EmailHelp:Setting {title: 'Email Help'})
CREATE (DomainNotification:Setting {title: 'Domain Notification'})
CREATE (TrackingEnabled:Setting {title: 'Tracking Enabled'})
CREATE (HumanizationStrategy:Setting {title: 'Humanization Strategy'})
CREATE (NestedQueries:Setting {title: 'Nested Queries'})
CREATE (Update:Setting {title: 'Update Setting'})
CREATE
(AdminGroup)-[:CAN_SET]->(SiteName),
(AdminGroup)-[:CAN_SET]->(SiteURL),
(AdminGroup)-[:CAN_SET]->(EmailHelp),
(AdminGroup)-[:CAN_SET]->(DomainNotification),
(AdminGroup)-[:CAN_SET]->(TrackingEnabled),
(AdminGroup)-[:CAN_SET]->(HumanizationStrategy),
(AdminGroup)-[:CAN_SET]->(NestedQueries),
(AdminGroup)-[:CAN_SET]->(Update),
(Attributes)-[:CAN_BE_SET_FROM]->(EnvVar),
(SiteName)-[:CAN_BE_SET_FROM]->(EnvVar),
(SiteURL)-[:CAN_BE_SET_FROM]->(EnvVar),
(EmailHelp)-[:CAN_BE_SET_FROM]->(EnvVar),
(DomainNotification)-[:CAN_BE_SET_FROM]->(EnvVar),
(TrackingEnabled)-[:CAN_BE_SET_FROM]->(EnvVar),
(HumanizationStrategy)-[:CAN_BE_SET_FROM]->(EnvVar),
(NestedQueries)-[:CAN_BE_SET_FROM]->(EnvVar),
(Update)-[:CAN_BE_SET_FROM]->(EnvVar)

CREATE (XRayF:Feature {title: 'XRayF'})
CREATE (XRayS:Setting {title: 'XRayS'})
CREATE
(AdminGroup)-[:CAN_SET]->(XRayS),
(XRayS)-[:CAN_BE_SET_FROM]->(EnvVar),
(XRayF)-[:HAS]->(XRayS),
(XRayF)-[:GENERATES]->(Question),
(XRayF)-[:GENERATES]->(Dashboard)

CREATE (Email:Feature {title: 'Email Feature for notifications'})
CREATE (SMTPHost:EmailSetting {title: 'Smtp host Setting'})
CREATE (SMTPPort:EmailSetting {title: 'Smtp Port setting'})
CREATE (SMTPSecurity:EmailSetting {title: 'Smtp Security setting'})
CREATE (SMTPUsername:EmailSetting {title: 'Smtp username setting'})
CREATE (SMTPPassword:EmailSetting {title: 'Smtp Password setting'})
CREATE (SMTPFromName:EmailSetting {title: 'Smtp From Name setting'})
CREATE (SMTPFromAddress:EmailSetting {title: 'Smtp From Address setting'})
CREATE (SMTPReplyToAddress:EmailSetting {title: 'Smtp Reply to setting'})
CREATE
(AdminGroup)-[:CAN_SET]->(SMTPHost),
(AdminGroup)-[:CAN_SET]->(SMTPPort),
(AdminGroup)-[:CAN_SET]->(SMTPSecurity),
(AdminGroup)-[:CAN_SET]->(SMTPUsername),
(AdminGroup)-[:CAN_SET]->(SMTPPassword),
(AdminGroup)-[:CAN_SET]->(SMTPFromName),
(AdminGroup)-[:CAN_SET]->(SMTPFromAddress),
(AdminGroup)-[:CAN_SET]->(SMTPReplyToAddress),
(SMTPHost)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPPort)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPSecurity)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPUsername)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPPassword)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPFromName)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPFromAddress)-[:CAN_BE_SET_FROM]->(EnvVar),
(SMTPReplyToAddress)-[:CAN_BE_SET_FROM]->(EnvVar)

CREATE (Slack:Feature {title: 'Slack Feature for notifications'})
CREATE (SlackToken:Feature {title: 'Slack Token for notifications'})
CREATE (SlackChannel:Feature {title: 'Slack Channel for notifications'})
CREATE
(Slack)-[:HAS]->(SlackToken),
(Slack)-[:HAS]->(SlackChannel),
(SlackToken)-[:CAN_BE_SET_FROM]->(EnvVar),
(SlackChannel)-[:CAN_BE_SET_FROM]->(EnvVar),
(AdminGroup)-[:CAN_SET]->(SlackToken),
(AdminGroup)-[:CAN_SET]->(SlackChannel)

CREATE (CustomMaps:Feature {title: 'Custom Maps'})
CREATE (CustomMapTileServerURL:MapSetting {title: 'Custom Map Tile Server URL'})
CREATE (CustomMapName:MapSetting {title: 'Custom Map Name'})
CREATE (CustomMapURL:MapSetting {title: 'URL to get the custom map'})
CREATE (CustomMapRegionIdentifier:MapSetting {title: 'Region Identifier'})
CREATE (CustomMapRegionName:MapSetting {title: 'Region Name'})
CREATE
(CustomMaps)-[:HAS]->(CustomMapTileServerURL),
(CustomMaps)-[:HAS]->(CustomMapName),
(CustomMaps)-[:HAS]->(CustomMapURL),
(CustomMaps)-[:HAS]->(CustomMapRegionIdentifier),
(CustomMaps)-[:HAS]->(CustomMapRegionName),
(CustomMapTileServerURL)-[:CAN_BE_SET_FROM]->(EnvVar)



CREATE (Filter:Feature {title: 'Filter'})
CREATE (Parameter:QuestionFilterType {title: 'Parameter'})
CREATE (FieldFilter:QuestionFilterType {title: 'Field Filter'})
CREATE
(Question)-[:CAN_HAVE]->(Parameter),
(Question)-[:CAN_HAVE]->(FieldFilter)
CREATE (TextFilter:DashboardFilterType {title: 'Text Filter'})
CREATE (DateFilter:DashboardFilterType {title: 'Date Filter'})
CREATE (LocationFilter:DashboardFilterType {title: 'Location Filter'})
CREATE (NumberFilter:DashboardFilterType {title: 'Number Filter'})
CREATE (IDFilter:DashboardFilterType {title: 'ID Filter'})
CREATE
(Dashboard)-[:CAN_HAVE]->(TextFilter),
(Dashboard)-[:CAN_HAVE]->(DateFilter),
(Dashboard)-[:CAN_HAVE]->(LocationFilter),
(Dashboard)-[:CAN_HAVE]->(NumberFilter),
(Dashboard)-[:CAN_HAVE]->(IDFilter)

// Pendings
// Create Base types
// Create semantic types
// Create Premium features - specifically audit
// Create Visualizations
// Subscriptions and Alerts
// Snippets