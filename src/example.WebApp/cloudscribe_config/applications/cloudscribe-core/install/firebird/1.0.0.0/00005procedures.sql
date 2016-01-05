
SET TERM ^ ;
ALTER PROCEDURE MP_ROLES_INSERT (
    SITEID Integer,
    ROLENAME Varchar(50),
    DISPLAYNAME Varchar(50),
    SITEGUID Char(36),
    ROLEGUID Char(36) )
RETURNS (
    ROLEID Integer )
AS
BEGIN
 ROLEID = NEXT VALUE FOR mp_Roles_seq;

INSERT INTO 	MP_ROLES
(				
                ROLEID,
                SITEID,
                ROLENAME,
                DISPLAYNAME,
		SITEGUID,
                ROLEGUID
) 
VALUES 
(				
               :ROLEID,
               :SITEID,
               :ROLENAME,
               :DISPLAYNAME,
	       :SITEGUID,
               :ROLEGUID
);

END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE MP_ROLES_INSERT TO SYSDBA;


SET TERM ^ ;
ALTER PROCEDURE MP_SITES_INSERT (
    SITEGUID Char(36),
    SITENAME Varchar(255),
    SKIN Varchar(100),
    ALLOWNEWREGISTRATION Smallint,
    USESECUREREGISTRATION Smallint,
    USESSLONALLPAGES Smallint,
    ISSERVERADMINSITE Smallint,
    USELDAPAUTH Smallint,
    AUTOCREATELDAPUSERONFIRSTLOGIN Smallint,
    LDAPSERVER Varchar(255),
    LDAPPORT Integer,
    LDAPDOMAIN Varchar(255),
    LDAPROOTDN Varchar(255),
    LDAPUSERDNKEY Varchar(10),
    REALLYDELETEUSERS Smallint,
    USEEMAILFORLOGIN Smallint,
    ALLOWUSERFULLNAMECHANGE Smallint,
    REQUIRESQUESTIONANDANSWER Smallint,
    MAXINVALIDPASSWORDATTEMPTS Integer,
    PASSWORDATTEMPTWINDOWMINUTES Integer,
    MINREQUIREDPASSWORDLENGTH Integer,
    MINREQNONALPHACHARS Integer,
    DEFAULTEMAILFROMADDRESS Varchar(100),
    RECAPTCHAPRIVATEKEY Varchar(255),
    RECAPTCHAPUBLICKEY Varchar(255),
    APIKEYEXTRA1 Varchar(255),
    APIKEYEXTRA2 Varchar(255),
    APIKEYEXTRA3 Varchar(255),
    APIKEYEXTRA4 Varchar(255),
    APIKEYEXTRA5 Varchar(255),
    DISABLEDBAUTH smallint )
RETURNS (
    SITEID Integer )
AS
BEGIN
 SITEID = NEXT VALUE FOR mp_Sites_seq;

INSERT INTO 	MP_SITES
(				
                SITEID,
                SITEGUID,
                SITENAME,
                SKIN,
                ALLOWNEWREGISTRATION,
                USESECUREREGISTRATION,
                USESSLONALLPAGES,
                ISSERVERADMINSITE,
                USELDAPAUTH,
                AUTOCREATELDAPUSERONFIRSTLOGIN,
                LDAPSERVER,
                LDAPPORT,
                LDAPDOMAIN,
                LDAPROOTDN,
                LDAPUSERDNKEY,
                REALLYDELETEUSERS,
                USEEMAILFORLOGIN,
                ALLOWUSERFULLNAMECHANGE,
                REQUIRESQUESTIONANDANSWER,
                MAXINVALIDPASSWORDATTEMPTS,
                PASSWORDATTEMPTWINDOWMINUTES,
                MINREQUIREDPASSWORDLENGTH,
                MINREQNONALPHACHARS,
                DEFAULTEMAILFROMADDRESS,
                RECAPTCHAPRIVATEKEY,
                RECAPTCHAPUBLICKEY,
				APIKEYEXTRA1,
				APIKEYEXTRA2,
				APIKEYEXTRA3,
				APIKEYEXTRA4,
                APIKEYEXTRA5,
				DisableDbAuth
) 
VALUES 
(				
               :SITEID,
               :SITEGUID,
               :SITENAME,
               :SKIN,
               :ALLOWNEWREGISTRATION,
               :USESECUREREGISTRATION,
               :USESSLONALLPAGES,
               :ISSERVERADMINSITE,
               :USELDAPAUTH,
               :AUTOCREATELDAPUSERONFIRSTLOGIN,
               :LDAPSERVER,
               :LDAPPORT,
               :LDAPDOMAIN,
               :LDAPROOTDN,
               :LDAPUSERDNKEY,
               :REALLYDELETEUSERS,
               :USEEMAILFORLOGIN,
               :ALLOWUSERFULLNAMECHANGE,
               :REQUIRESQUESTIONANDANSWER,
               :MAXINVALIDPASSWORDATTEMPTS,
               :PASSWORDATTEMPTWINDOWMINUTES,
               :MINREQUIREDPASSWORDLENGTH,
               :MINREQNONALPHACHARS,
               :DEFAULTEMAILFROMADDRESS,
                :RECAPTCHAPRIVATEKEY,
                :RECAPTCHAPUBLICKEY,   
			   :APIKEYEXTRA1,
			   :APIKEYEXTRA2,
			   :APIKEYEXTRA3,
			   :APIKEYEXTRA4,
               :APIKEYEXTRA5,
			   :DisableDbAuth
);

END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE MP_SITES_INSERT TO SYSDBA;


SET TERM ^ ;
ALTER PROCEDURE MP_USERROLES_INSERT (
    USERID Integer,
    ROLEID Integer,
    USERGUID Char(36),
    ROLEGUID Char(36) )
RETURNS (
    ID Integer )
AS
BEGIN
 ID = NEXT VALUE FOR mp_UserRoles_seq;

INSERT INTO 	MP_USERROLES
(				
                ID,
                USERID,
                ROLEID,
                USERGUID,
                ROLEGUID
) 
VALUES 
(				
               :ID,
               :USERID,
               :ROLEID,
               :USERGUID,
               :ROLEGUID
);

END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE MP_USERROLES_INSERT TO SYSDBA;





GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_CURRENCY TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_GEOCOUNTRY TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_GEOZONE TO SYSDBA WITH GRANT OPTION;


GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_LANGUAGE TO SYSDBA WITH GRANT OPTION;


ALTER TABLE MP_ROLES ADD CONSTRAINT FK_ROLES_SITES
  FOREIGN KEY (SITEID) REFERENCES MP_SITES (SITEID);
CREATE INDEX IDX_ROLES_SITEID ON MP_ROLES (SITEID);
GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_ROLES TO SYSDBA WITH GRANT OPTION;


GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_SITEFOLDERS TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_SITEHOSTS TO SYSDBA WITH GRANT OPTION;


GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_SITES TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_SITESETTINGSEX TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_SITESETTINGSEXDEF TO SYSDBA WITH GRANT OPTION;


GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_USERLOCATION TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_USERPROPERTIES TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_USERROLES TO SYSDBA WITH GRANT OPTION;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_USERS TO SYSDBA WITH GRANT OPTION;


 GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_USERCLAIMS TO  SYSDBA WITH GRANT OPTION;
 
 GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON MP_USERLOGINS TO  SYSDBA WITH GRANT OPTION;
 
 
 SET TERM ^ ;
CREATE PROCEDURE MP_USERCLAIMS_INSERT (
    USERID varchar(128),
    CLAIMTYPE blob sub_type 1,
    CLAIMVALUE blob sub_type 1 )
RETURNS (
    ID integer )
AS
BEGIN
 ID = NEXT VALUE FOR mp_UserClaims_seq;

INSERT INTO 	mp_USERCLAIMS
(				
                ID,
                USERID,
                CLAIMTYPE,
                CLAIMVALUE
) 
VALUES 
(				
               :ID,
               :USERID,
               :CLAIMTYPE,
               :CLAIMVALUE
);

END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE MP_USERCLAIMS_INSERT TO  SYSDBA;
 