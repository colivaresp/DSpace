--   The contents of this file are subject to the license and copyright
--   detailed in the LICENSE and NOTICE files at the root of the source
--   tree and available online at
--   
--   https://github.com/CILEA/dspace-cris/wiki/License
--
-- SQL commands to upgrade the database schema of a live DSpace-CRIS
-- to the DSpace 1.8 database schema
--
-- DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST.
-- DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST.
-- DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST. DUMP YOUR DATABASE FIRST.

create table cris_organizationunit (id int4 not null, crisID varchar(255) unique, sourceID varchar(255) unique, status bool, uuid varchar(255) not null unique, timestampCreated timestamp, timestampLastModified timestamp, primary key (id));
create table cris_ou_box (id int4 not null, collapsed bool not null, externalJSP varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), unrelevant bool not null, visibility int4, primary key (id));
create table cris_ou_box2containable (cris_ou_box_id int4 not null, mask_id int4 not null);
create table cris_ou_edittab (id int4 not null, ext varchar(255), mandatory bool not null, mime varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), visibility int4, displayTab_id int4, primary key (id));
create table cris_ou_edittab2box (cris_ou_edittab_id int4 not null, mask_id int4 not null);
create table cris_ou_nestedobject (id int4 not null, status bool, timestampCreated timestamp, timestampLastModified timestamp, uuid varchar(255) not null unique, parent_id int4, typo_id int4, primary key (id));
create table cris_ou_nestedobject_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table cris_ou_nestedobject_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table cris_ou_nestedobject_typo (id int4 not null, label varchar(255), shortName varchar(255), accessLevel int4, help text, inline bool not null, mandatory bool not null, newline bool not null, priority int4 not null, repeatable bool not null, primary key (id));
create table cris_ou_nestedobject_typo2mask (cris_ou_nestedobject_typo_id int4 not null, mask_id int4 not null);
create table cris_ou_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table cris_ou_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table cris_ou_tab (id int4 not null, ext varchar(255), mandatory bool not null, mime varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), visibility int4, primary key (id));
create table cris_ou_tab2box (cris_ou_tab_id int4 not null, mask_id int4 not null);
create table cris_ou_widgetfile (id int4 not null, fileDescription text, labelAnchor varchar(255), showPreview bool not null, size int4 not null, primary key (id));
create table cris_project (id int4 not null, crisID varchar(255) unique, sourceID varchar(255) unique, status bool, uuid varchar(255) not null unique, timestampCreated timestamp, timestampLastModified timestamp, primary key (id));
create table cris_project_box (id int4 not null, collapsed bool not null, externalJSP varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), unrelevant bool not null, visibility int4, primary key (id));
create table cris_project_box2containable (cris_project_box_id int4 not null, mask_id int4 not null);
create table cris_project_edittab (id int4 not null, ext varchar(255), mandatory bool not null, mime varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), visibility int4, displayTab_id int4, primary key (id));
create table cris_project_edittab2box (cris_project_edittab_id int4 not null, mask_id int4 not null);
create table cris_project_nestedobject (id int4 not null, status bool, timestampCreated timestamp, timestampLastModified timestamp, uuid varchar(255) not null unique, parent_id int4, typo_id int4, primary key (id));
create table cris_project_nestedobject_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table cris_project_nestedobject_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table cris_project_nestedobject_typo (id int4 not null, label varchar(255), shortName varchar(255), accessLevel int4, help text, inline bool not null, mandatory bool not null, newline bool not null, priority int4 not null, repeatable bool not null, primary key (id));
create table cris_project_nestedobject_typo2mask (cris_project_nestedobject_typo_id int4 not null, mask_id int4 not null);
create table cris_project_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table cris_project_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table cris_project_tab (id int4 not null, ext varchar(255), mandatory bool not null, mime varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), visibility int4, primary key (id));
create table cris_project_tab2box (cris_project_tab_id int4 not null, mask_id int4 not null);
create table cris_project_widgetfile (id int4 not null, fileDescription text, labelAnchor varchar(255), showPreview bool not null, size int4 not null, primary key (id));
create table cris_researcherpage (id int4 not null, crisID varchar(255) unique, sourceID varchar(255) unique, status bool, uuid varchar(255) not null unique, epersonID int4 unique, namesTimestampLastModified timestamp, timestampCreated timestamp, timestampLastModified timestamp, primary key (id));
create table cris_researcherpage_rejectItems (cris_researcherpage_id int4 not null, element int4);
create table cris_rp_box (id int4 not null, collapsed bool not null, externalJSP varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), unrelevant bool not null, visibility int4, primary key (id));
create table cris_rp_box2containable (cris_rp_box_id int4 not null, mask_id int4 not null);
create table cris_rp_edittab (id int4 not null, ext varchar(255), mandatory bool not null, mime varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), visibility int4, displayTab_id int4, primary key (id));
create table cris_rp_edittab2box (cris_rp_edittab_id int4 not null, mask_id int4 not null);
create table cris_rp_nestedobject (id int4 not null, status bool, timestampCreated timestamp, timestampLastModified timestamp, uuid varchar(255) not null unique, parent_id int4, typo_id int4, primary key (id));
create table cris_rp_nestedobject_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table cris_rp_nestedobject_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table cris_rp_nestedobject_typo (id int4 not null, label varchar(255), shortName varchar(255), accessLevel int4, help text, inline bool not null, mandatory bool not null, newline bool not null, priority int4 not null, repeatable bool not null, primary key (id));
create table cris_rp_nestedobject_typo2mask (cris_rp_nestedobject_typo_id int4 not null, mask_id int4 not null);
create table cris_rp_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table cris_rp_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table cris_rp_subscription (id int4 not null, epersonID int4 not null, rp_id int4, primary key (id));
create table cris_rp_tab (id int4 not null, ext varchar(255), mandatory bool not null, mime varchar(255), priority int4 not null, shortName varchar(255) unique, title varchar(255), visibility int4, primary key (id));
create table cris_rp_tab2box (cris_rp_tab_id int4 not null, mask_id int4 not null);
create table cris_rp_widgetfile (id int4 not null, fileDescription text, labelAnchor varchar(255), showPreview bool not null, size int4 not null, primary key (id));
create table jdyna_containables (DTYPE varchar(31) not null, id int4 not null, propertiesdefinition_fk int4, propertiesdefinitionproject_fk int4, propertiesdefinitionou_fk int4, pdrpnestedobject_fk int4, pdprojectnestedobject_fk int4, pdounestedobject_fk int4, typerpnestedobject_fk int4, typeprojectnestedobject_fk int4, typeounestedobject_fk int4, propertiesdefinitionnestedobject_fk int4, primary key (id));
create table jdyna_nestedobject (id int4 not null, status bool, timestampCreated timestamp, timestampLastModified timestamp, uuid varchar(255) not null unique, typo_id int4, primary key (id));
create table jdyna_nestedobject_prop (id int4 not null, lock int4, position int4 not null, scope varchar(255), visibility int4, value_id int4 unique, parent_id int4, typo_id int4, primary key (id), unique (position, typo_id, parent_id));
create table jdyna_nestedobject_propertiesdefinition (id int4 not null, accessLevel int4, advancedSearch bool not null, fieldmin_col int4, fieldmin_col_unit varchar(255), fieldmin_row_unit varchar(255), fieldmin_row int4, help text, label varchar(255), labelMinSize int4 not null, labelMinSizeUnit varchar(255), mandatory bool not null, newline bool not null, onCreation bool, priority int4 not null, repeatable bool not null, shortName varchar(255) unique, showInList bool not null, simpleSearch bool not null, rendering_id int4 unique, primary key (id));
create table jdyna_nestedobject_typo (id int4 not null, label varchar(255), shortName varchar(255), accessLevel int4, help text, inline bool not null, mandatory bool not null, newline bool not null, priority int4 not null, repeatable bool not null, primary key (id));
create table jdyna_nestedobject_typo2mask (jdyna_nestedobject_typo_id int4 not null, mask_id int4 not null);
create table jdyna_values (DTYPE varchar(31) not null, id int4 not null, sortValue varchar(255), dateValue timestamp, testoValue text, linkdescription varchar(255), linkvalue text, fileextension varchar(255), filefolder varchar(255), filemime varchar(255), filevalue text, rpvalue int4, projectvalue int4, ouvalue int4, primary key (id));
create table jdyna_widget_date (id int4 not null, maxYear int4, minYear int4, time bool not null, primary key (id));
create table jdyna_widget_link (id int4 not null, labelHeaderLabel varchar(255), labelHeaderURL varchar(255), size int4 not null, primary key (id));
create table jdyna_widget_pointer (id int4 not null, display text, filtro text, indexName varchar(255), size int4 not null, target varchar(255), primary key (id));
create table jdyna_widget_text (id int4 not null, collisioni bool, col int4 not null, measurementUnitCol varchar(255), measurementUnitRow varchar(255), row int4 not null, htmlToolbar varchar(255), multilinea bool not null, regex varchar(255), primary key (id));
alter table cris_ou_box2containable add constraint FKA10F1DD49B33F69D foreign key (cris_ou_box_id) references cris_ou_box;
alter table cris_ou_box2containable add constraint FKA10F1DD46760D09E foreign key (mask_id) references jdyna_containables;
alter table cris_ou_edittab add constraint FKA92DB618DA71BC0C foreign key (displayTab_id) references cris_ou_tab;
alter table cris_ou_edittab2box add constraint FK50CD227179BB3449 foreign key (mask_id) references cris_ou_box;
alter table cris_ou_edittab2box add constraint FK50CD227111CF087D foreign key (cris_ou_edittab_id) references cris_ou_edittab;
alter table cris_ou_nestedobject add constraint FKCF310E4912DD8273 foreign key (typo_id) references cris_ou_nestedobject_typo;
alter table cris_ou_nestedobject add constraint FKCF310E4961AD7352 foreign key (parent_id) references cris_organizationunit;
create index cris_ou_nestedobject_prop_parent_id on cris_ou_nestedobject_prop (parent_id);
alter table cris_ou_nestedobject_prop add constraint FK6D48D399DFE24D40 foreign key (typo_id) references cris_ou_nestedobject_propertiesdefinition;
alter table cris_ou_nestedobject_prop add constraint FKC8A841F5E52079D76d48d399 foreign key (value_id) references jdyna_values;
alter table cris_ou_nestedobject_prop add constraint FK6D48D39967A17973 foreign key (parent_id) references cris_ou_nestedobject;
alter table cris_ou_nestedobject_typo2mask add constraint FK11B77AE444CAD498 foreign key (mask_id) references cris_ou_nestedobject_propertiesdefinition;
alter table cris_ou_nestedobject_typo2mask add constraint FK11B77AE4B333DE7D foreign key (cris_ou_nestedobject_typo_id) references cris_ou_nestedobject_typo;
create index cris_ou_prop_parent_id on cris_ou_prop (parent_id);
alter table cris_ou_prop add constraint FK5DE185B64F4B3769 foreign key (typo_id) references cris_ou_propertiesdefinition;
alter table cris_ou_prop add constraint FKC8A841F5E52079D75de185b6 foreign key (value_id) references jdyna_values;
alter table cris_ou_prop add constraint FK5DE185B661AD7352 foreign key (parent_id) references cris_organizationunit;
alter table cris_ou_tab2box add constraint FKBD0BBE3B8083565D foreign key (cris_ou_tab_id) references cris_ou_tab;
alter table cris_ou_tab2box add constraint FKBD0BBE3B79BB3449 foreign key (mask_id) references cris_ou_box;
alter table cris_project_box2containable add constraint FK264FF47B27260210 foreign key (cris_project_box_id) references cris_project_box;
alter table cris_project_box2containable add constraint FK264FF47B6760D09E foreign key (mask_id) references jdyna_containables;
alter table cris_project_edittab add constraint FKBB8723BF258F9F32 foreign key (displayTab_id) references cris_project_tab;
alter table cris_project_edittab2box add constraint FK97D96498682E7E43 foreign key (mask_id) references cris_project_box;
alter table cris_project_edittab2box add constraint FK97D96498BC932DB0 foreign key (cris_project_edittab_id) references cris_project_edittab;
alter table cris_project_nestedobject add constraint FK69AD110243AB27D8 foreign key (typo_id) references cris_project_nestedobject_typo;
alter table cris_project_nestedobject add constraint FK69AD110257CB965E foreign key (parent_id) references cris_project;
create index cris_project_nestedobject_prop_parent_id on cris_project_nestedobject_prop (parent_id);
alter table cris_project_nestedobject_prop add constraint FKA5AE9C8059E03865 foreign key (typo_id) references cris_project_nestedobject_propertiesdefinition;
alter table cris_project_nestedobject_prop add constraint FKC8A841F5E52079D7a5ae9c80 foreign key (value_id) references jdyna_values;
alter table cris_project_nestedobject_prop add constraint FKA5AE9C8093FB9958 foreign key (parent_id) references cris_project_nestedobject;
alter table cris_project_nestedobject_typo2mask add constraint FK23DE2A5DBEC8BFBD foreign key (mask_id) references cris_project_nestedobject_propertiesdefinition;
alter table cris_project_nestedobject_typo2mask add constraint FK23DE2A5DF0CFBD9B foreign key (cris_project_nestedobject_typo_id) references cris_project_nestedobject_typo;
create index cris_project_prop_idx_parent_id on cris_project_prop (parent_id);
alter table cris_project_prop add constraint FKB0E4516F6C4DA24E foreign key (typo_id) references cris_project_propertiesdefinition;
alter table cris_project_prop add constraint FKC8A841F5E52079D7b0e4516f foreign key (value_id) references jdyna_values;
alter table cris_project_prop add constraint FKB0E4516F57CB965E foreign key (parent_id) references cris_project;
alter table cris_project_tab2box add constraint FKCF652BE2682E7E43 foreign key (mask_id) references cris_project_box;
alter table cris_project_tab2box add constraint FKCF652BE2691FFAFC foreign key (cris_project_tab_id) references cris_project_tab;
alter table cris_researcherpage_rejectItems add constraint FK4990335FCB4E017F foreign key (cris_researcherpage_id) references cris_researcherpage;
alter table cris_rp_box2containable add constraint FK5B736E2C6760D09E foreign key (mask_id) references jdyna_containables;
alter table cris_rp_box2containable add constraint FK5B736E2C74E43925 foreign key (cris_rp_box_id) references cris_rp_box;
alter table cris_rp_edittab add constraint FKA0B3DE70D46F7C6C foreign key (displayTab_id) references cris_rp_tab;
alter table cris_rp_edittab2box add constraint FK4DD75EC99E040A29 foreign key (mask_id) references cris_rp_box;
alter table cris_rp_edittab2box add constraint FK4DD75EC9CC3EF05 foreign key (cris_rp_edittab_id) references cris_rp_edittab;
alter table cris_rp_nestedobject add constraint FK736E5CF1CD41D2CB foreign key (typo_id) references cris_rp_nestedobject_typo;
alter table cris_rp_nestedobject add constraint FK736E5CF1B926FEF2 foreign key (parent_id) references cris_researcherpage;
create index cris_rp_nestedobject_prop_parent_id on cris_rp_nestedobject_prop (parent_id);
alter table cris_rp_nestedobject_prop add constraint FK1FDA6DF193C00F98 foreign key (typo_id) references cris_rp_nestedobject_propertiesdefinition;
alter table cris_rp_nestedobject_prop add constraint FKC8A841F5E52079D71fda6df1 foreign key (value_id) references jdyna_values;
alter table cris_rp_nestedobject_prop add constraint FK1FDA6DF164ABB5CB foreign key (parent_id) references cris_rp_nestedobject;
alter table cris_rp_nestedobject_typo2mask add constraint FKB240978CF8A896F0 foreign key (mask_id) references cris_rp_nestedobject_propertiesdefinition;
alter table cris_rp_nestedobject_typo2mask add constraint FKB240978CAB90557D foreign key (cris_rp_nestedobject_typo_id) references cris_rp_nestedobject_typo;
create index cris_rp_prop_parent_id on cris_rp_prop (parent_id);
alter table cris_rp_prop add constraint FKF40BFC5EA3DF9BC1 foreign key (typo_id) references cris_rp_propertiesdefinition;
alter table cris_rp_prop add constraint FKC8A841F5E52079D7f40bfc5e foreign key (value_id) references jdyna_values;
alter table cris_rp_prop add constraint FKF40BFC5EB926FEF2 foreign key (parent_id) references cris_researcherpage;
alter table cris_rp_subscription add constraint FK266E8718443B20DE foreign key (rp_id) references cris_researcherpage;
alter table cris_rp_tab2box add constraint FKB491E6939E040A29 foreign key (mask_id) references cris_rp_box;
alter table cris_rp_tab2box add constraint FKB491E6932FE88365 foreign key (cris_rp_tab_id) references cris_rp_tab;
alter table jdyna_containables add constraint FKB80C84B23C2EA28B foreign key (typeounestedobject_fk) references cris_ou_nestedobject_typo;
alter table jdyna_containables add constraint FKB80C84B213D3F9DE foreign key (pdounestedobject_fk) references cris_ou_nestedobject_propertiesdefinition;
alter table jdyna_containables add constraint FKB80C84B2F8B681D8 foreign key (pdprojectnestedobject_fk) references cris_project_nestedobject_propertiesdefinition;
alter table jdyna_containables add constraint FKB80C84B251D600DE foreign key (pdrpnestedobject_fk) references cris_rp_nestedobject_propertiesdefinition;
alter table jdyna_containables add constraint FKB80C84B26658C4A9 foreign key (propertiesdefinition_fk) references cris_rp_propertiesdefinition;
alter table jdyna_containables add constraint FKB80C84B2302DAC43 foreign key (propertiesdefinitionnestedobject_fk) references jdyna_nestedobject_propertiesdefinition;
alter table jdyna_containables add constraint FKB80C84B280B7378B foreign key (typerpnestedobject_fk) references cris_rp_nestedobject_typo;
alter table jdyna_containables add constraint FKB80C84B29725B949 foreign key (propertiesdefinitionproject_fk) references cris_project_propertiesdefinition;
alter table jdyna_containables add constraint FKB80C84B27E011A11 foreign key (typeprojectnestedobject_fk) references cris_project_nestedobject_typo;
alter table jdyna_containables add constraint FKB80C84B2BBDACA2B foreign key (propertiesdefinitionou_fk) references cris_ou_propertiesdefinition;
alter table jdyna_nestedobject add constraint FK99FADDA347739B84 foreign key (typo_id) references jdyna_nestedobject_typo;
create index jdyna_nestedobject_prop_parent_id on jdyna_nestedobject_prop (parent_id);
alter table jdyna_nestedobject_prop add constraint FKCCDC8C7F99D0511 foreign key (typo_id) references jdyna_nestedobject_propertiesdefinition;
alter table jdyna_nestedobject_prop add constraint FKC8A841F5E52079D7ccdc8c7f foreign key (value_id) references jdyna_values;
alter table jdyna_nestedobject_prop add constraint FKCCDC8C7F9B08C304 foreign key (parent_id) references jdyna_nestedobject;
alter table jdyna_nestedobject_typo2mask add constraint FKFA3161BE6E858C69 foreign key (mask_id) references jdyna_nestedobject_propertiesdefinition;
alter table jdyna_nestedobject_typo2mask add constraint FKFA3161BE4F63CCE8 foreign key (jdyna_nestedobject_typo_id) references jdyna_nestedobject_typo;
create index jdyna_values_idx_dtype on jdyna_values (DTYPE);
alter table jdyna_values add constraint FK51AA118FA46E05CD foreign key (ouvalue) references cris_organizationunit;
alter table jdyna_values add constraint FK51AA118F15A13386 foreign key (projectvalue) references cris_project;
alter table jdyna_values add constraint FK51AA118F92120815 foreign key (rpvalue) references cris_researcherpage;
create sequence BOX_SEQ;
create sequence CONTAINABLE_SEQ;
create sequence CRIS_OU_SEQ;
create sequence CRIS_PROJECT_SEQ;
create sequence CRIS_RESEARCHERPAGE_SEQ;
create sequence JDYNA_NESTEDOBJECT_SEQ;
create sequence JDYNA_TYPONESTEDOBJECT_SEQ;
create sequence PROPERTIESDEFINITION_SEQ;
create sequence PROPERTY_SEQ;
create sequence SUBSCRIPTIONRP_SEQ;
create sequence TAB_SEQ;
create sequence VALUES_SEQ;
create sequence WIDGET_SEQ;