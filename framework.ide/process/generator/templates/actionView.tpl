{nocache}
<Action name="view" screen="scrView">
  <Var name="selectedId" process="true">
    <ActionValue/>
  </Var>
  <Control method="bind" object="frmView">
    <Param>
      <Call library="{$apiApplication},{$apiProcess},api" function="getById">
        <Param name="id"><ActionValue/></Param>
      </Call>
    </Param>
  </Control>
</Action>
{/nocache}
