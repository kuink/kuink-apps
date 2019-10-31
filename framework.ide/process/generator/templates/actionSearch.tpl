{nocache}
<Action name="search" screen="scrSearch">
  <!-- Set default data if applicable -->
  <If condition="$defaultData->__length > 0">
    <Then>
      <Control method="setDefaultData" object="frmSearch">
        <Param><Var name="defaultData"/></Param>
      </Control>
    </Then>
  </If>
  <Var name="currentData">
    <Control method="getCurrentData" object="frmSearch"/>  
  </Var>        
  
  <Control method="bind" object="grdSearchResult">
    <Param>
      <Call library="{$apiApplication},{$apiProcess},api" function="search">
        {foreach $attributes as $field}
        {if $field['search'] == 1}
        <Param name="{$field['name']}"><Var name="currentData" key="{$field['name']}"/></Param>
        {/if}
        {/foreach}    
        <Param name="pagesize">
          <Control method="getPageSize" object="grdSearchResult"/>
        </Param>
        <Param name="pagenum">
          <Control method="getCurrentPage" object="grdSearchResult"/>
        </Param> 
      </Call>          
    </Param>
  </Control>  
</Action>
{/nocache}