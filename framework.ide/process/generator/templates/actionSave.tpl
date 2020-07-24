{nocache}
<Action name="save">
  <If condition="@selectedId == ''">
    <Then>
      <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="add" params="POSTDATA"/>
    </Then>
    <Else>
      <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="update" params="POSTDATA">
        <Param name="id"><Var name="selectedId" process="true"/></Param>
      </Call>    
    </Else>
  </If>
  
  <Action name="search"/>
</Action>
{/nocache}