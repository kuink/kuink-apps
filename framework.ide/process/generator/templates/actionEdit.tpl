{nocache}
<Action name="edit" screen="scrEdit">
  <Var name="selectedId" process="true">
      <IsNull>
         <Param><ActionValue/></Param>
         <Param><Var name="selectedId" process="true"/></Param>
      </IsNull>
  </Var>
  <Control method="bind" object="frmEdit">
    <Param>
      <Call library="{$apiApplication},{$apiProcess},api" function="getById">
        <Param name="id">
          <Var name="selectedId" process="true"/>
        </Param>
      </Call>
    </Param>
  </Control>
</Action>
{/nocache}
