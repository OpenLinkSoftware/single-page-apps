create procedure
OPLSPA.DBA.CREATE_CONDITIONAL_GROUP ()
{
        declare default_realm varchar;
        declare acl_graph varchar;
        declare dba_id varchar;
        declare qry varchar;
        declare stat, msg, meta, data any;

        default_realm := VAL.DBA.get_default_realm ();
        acl_graph := VAL.DBA.val_acl_group_graph(default_realm);
        dba_id := VAL.DBA.user_personal_uri ('dba');

        exec (sprintf ('SPARQL
                        PREFIX acl: <http://www.w3.org/ns/auth/acl#>
                        PREFIX oplacl: <http://www.openlinksw.com/ontology/acl#>
                        PREFIX foaf: <http://xmlns.com/foaf/0.1/>

                        WITH GRAPH <%s>

                        INSERT {
                                <#OplSPADownloadNetID>
                                a oplacl:ConditionalGroup ;
                                foaf:name ''Identities names using a NetID based Identifier'' ;
                                foaf:maker <%s> ;
                                oplacl:hasCondition [
                                a
                                oplacl:GroupCondition,
                                oplacl:GenericCondition ;
                                oplacl:hasCriteria
                                oplacl:NetID ;
                                oplacl:hasComparator
                                oplacl:IsNotNull ;
                                oplacl:hasValue ''1''^^xsd:boolean
                                  ] .
                        }',  acl_graph, dba_id), stat, msg, vector(), 1, meta, data);

};

OPLSPA.DBA.CREATE_CONDITIONAL_GROUP ();

create procedure
OPLSPA.DBA.CREATE_PRIVATE_GRAPH_ACL_RULE()
{

        declare default_realm varchar;
        declare acl_graph varchar;
        declare dba_id varchar;
        declare qry varchar;
        declare stat, msg, meta, data any;

        default_realm := VAL.DBA.get_default_realm ();
        acl_graph := VAL.DBA.val_acl_rule_graph(default_realm);
        dba_id := VAL.DBA.user_personal_uri ('dba');

        exec (sprintf ('SPARQL
                        PREFIX acl: <http://www.w3.org/ns/auth/acl#>
                        PREFIX oplacl: <http://www.openlinksw.com/ontology/acl#>
                        PREFIX foaf: <http://xmlns.com/foaf/0.1/>

                        WITH GRAPH <%s>

                        INSERT {
                                <#NetIDSPAPrivateGraphRule1>  a acl:Authorization ;
                                rdfs:comment """This is a rule that grants access to the graph used by the downloads SPA to record searches to any identity denoted by a URI where identity claims are de-referenced and then verified using a variety of authentication protocols e.g., HTTP Digest, TLS basic, OAuth, WebID-TLS, OpenID, or Mozilla Persona """ ;
                                foaf:maker <%s> ;
                                acl:accessTo <urn:openlink:download:search:record> ;
                                oplacl:hasAccessMode oplacl:Read ;
                                oplacl:hasAccessMode oplacl:Write ;
                                acl:agent <#OplSPADownloadNetID> ;
                                oplacl:hasRealm oplacl:DefaultRealm ;
                                oplacl:hasScope <http://www.openlinksw.com/ontology/acl#PrivateGraphs> .
                        }',  acl_graph, dba_id), stat, msg, vector(), 1, meta, data);
};

OPLSPA.DBA.CREATE_PRIVATE_GRAPH_ACL_RULE();

create procedure
OPLSPA.DBA.CREATE_SPARQL_ENDPOINT_ACL_RULE()
{

        declare default_realm varchar;
        declare acl_graph varchar;
        declare dba_id varchar;
        declare qry varchar;
        declare stat, msg, meta, data any;

        default_realm := VAL.DBA.get_default_realm ();
        acl_graph := VAL.DBA.val_acl_rule_graph(default_realm);
        dba_id := VAL.DBA.user_personal_uri ('dba');

        exec (sprintf ('SPARQL
                        PREFIX acl: <http://www.w3.org/ns/auth/acl#>
                        PREFIX oplacl: <http://www.openlinksw.com/ontology/acl#>
                        PREFIX foaf: <http://xmlns.com/foaf/0.1/>

                        WITH GRAPH <%s>

                        INSERT {
                                <#NetIDSPASparqlEndpointRule1>  a acl:Authorization ;
                                rdfs:comment """This is a rule that grants sparql write access to any identity denoted by a URI where identity claims are de-referenced and then verified using a variety of authentication protocols e.g., HTTP Digest, TLS basic, OAuth, WebID-TLS, OpenID, or Mozilla Persona """ ;
                                foaf:maker <%s> ;
                                acl:accessTo <urn:virtuoso:access:sparql> ;
                                oplacl:hasAccessMode oplacl:Read ;
                                oplacl:hasAccessMode oplacl:Write ;
                                acl:agent <#OplSPADownloadNetID> ;
                                oplacl:hasRealm oplacl:DefaultRealm ;
                                oplacl:hasScope <http://www.openlinksw.com/ontology/acl#Query> .
                        }',  acl_graph, dba_id), stat, msg, vector(), 1, meta, data);
};

OPLSPA.DBA.CREATE_SPARQL_ENDPOINT_ACL_RULE();
