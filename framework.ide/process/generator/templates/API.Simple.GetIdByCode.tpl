<Function name="getIdByCode" doc="Get a record id by its code from entity {$entity}">
  <Params>
    <Param name="code" type="string" required="true"/>
  </Params>
  <Return type="int" doc="">
  </Return>    
  <Begin>
  	<Var name="record">
			<DataAccess method="load">
        <Param name="_entity">{$entity}</Param>
        <Param name="code"><Var name="PARAMS" key="code"/></Param>
      </DataAccess>  	
  	</Var>
    <Return>
    	<Var name="record" key="id"/>  
    </Return>
  </Begin>
</Function>
