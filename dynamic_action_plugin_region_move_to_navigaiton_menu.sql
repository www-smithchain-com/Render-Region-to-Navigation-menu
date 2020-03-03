prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1810418193191039
,p_default_application_id=>108
,p_default_owner=>'ADMIN'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/region_move_to_navigaiton_menu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(21922884045169794)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'REGION.MOVE.TO.NAVIGAITON.MENU'
,p_display_name=>'Render Region to Navigation'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION MV_REGN_TONAV (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME        => ''render_region'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL',
'        , p_check_to_add_minified => TRUE',
'    );  ',
'    ',
' apex_css.add_file(p_name=> ''render_region'',',
'                   p_directory=> p_plugin.file_prefix,',
'                   P_VERSION     => NULL                   ',
'                  );',
'    ',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'    function () {render_region(this); }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'MV_REGN_TONAV'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plugin will work on page load dynamic action and User can move affected region on navigation menu.'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/www-smithchain-com'
,p_files_version=>6
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2072656E6465725F726567696F6E2865297B636F6E7374206E3D5B2428652E6166666563746564456C656D656E7473295D3B313D3D2428652E6166666563746564456C656D656E7473292E6C656E6774683F242E65616368286E2C66';
wwv_flow_api.g_varchar2_table(2) := '756E6374696F6E28652C6E297B76617220743D6E5B305D2E69643B636F6E736F6C652E6C6F672874292C242866756E6374696F6E28297B24282223222B74292E70726570656E64546F282223745F547265654E617622292C24282223222B74292E616464';
wwv_flow_api.g_varchar2_table(3) := '436C6173732822726567696F6E5F62746E22297D297D293A616C6572742822416666656374656420456C656D656E7473204D7573742068617665203120524547494F4E22297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(21932019175204181)
,p_plugin_id=>wwv_flow_api.id(21922884045169794)
,p_file_name=>'render_region.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '23745F547265654E61767B646973706C61793A666C65783B666C65782D646972656374696F6E3A636F6C756D6E3B6865696768743A313030257D23745F547265654E617620756C7B666C65783A312030206175746F7D6469762E726567696F6E5F62746E';
wwv_flow_api.g_varchar2_table(2) := '7B666C65783A302030206175746F7D2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176206469762E726567696F6E5F62746E7B646973706C61793A6E6F6E657D2E736964655F696D6167657B6469';
wwv_flow_api.g_varchar2_table(3) := '73706C61793A626C6F636B3B6D617267696E2D6C6566743A6175746F3B6D617267696E2D72696768743A6175746F3B77696474683A313030257D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(21933471863216998)
,p_plugin_id=>wwv_flow_api.id(21922884045169794)
,p_file_name=>'render_region.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
