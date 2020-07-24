{nocache}
    <Action name="delete">
      <Var name="selectedId" process="true">
          <IsNull>
             <Param><ActionValue/></Param>
             <Param><Var name="selectedId" process="true"/></Param>
          </IsNull>
      </Var>
      <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="delete">
        <Param name="id"><Var name="selectedId" process="true"/></Param>
      </Call>
      <Action name="search"/>
    </Action>
{/nocache}