
<Function name="delete" doc="Delete a record by id from table {$entity}">
  <Params>
    <Param name="id" type="int" required="true"/>
  </Params>
  <Return type="int" doc=""/>
  <Begin>
    <Return>
      <DataAccess method="delete">
        <Param name="_entity">{$entity}</Param>
        <Param name="id"><Var name="PARAMS" key="id"/></Param>
      </DataAccess>
    </Return>
  </Begin>
</Function>
