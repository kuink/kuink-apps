				{nocache}
        <Function name="run" doc="Run the test">
            <Params>
              <Param name="context" doc="Context data"/>
            </Params>
            <Return type="single" doc="The result">
              <External name="code" type="int" doc="The result code"/>
              <External name="data" type="text" doc="Data returned by the function"/>
            </Return>
            <Errors>
              <Error code="-1" doc="Test failed"/>
            </Errors>            
            <Begin>
              <!--Permissions>
                <Allow>
                  <Capability name="framework/unitTest:run"/>
                </Allow>
              </Permissions-->
              <Transaction>								
              	<Var name="test" key="result"><String/></Var>
              	<Try>
	              	<Instructions>
										<Var name="test" key="resultAdd">
											<Call library="{$unitApplication},{$unitProcess},{$unitPrefix}.{$unitNode}.aux" function="addTestData"/>
										</Var>
									</Instructions>
									<Catch>
										<!-- Exception so invalidate the test -->
									
									</Catch>
								</Try>	
								<!-- The test record has been inserted, now try to delete it -->
								<Var name="result" key="data"><String.parse>Inserted id: $test->resultAdd</String.parse></Var>
								
								<!-- Check if the record exists -->
								<Var name="record">
									<Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="getById">
										<Param name="id"><Var name="test" key="resultAdd"/></Param>
									</Call>
								</Var>
								<Var name="result" key="data"><String.parse>$result->data Tested id: $record->id</String.parse></Var>
										
	              <If condition="$record->__length != 0">
	                <Then><Var name="code">0</Var></Then>
	                <Else><Var name="code">-1</Var></Else>
	              </If>
	              
	              <Var name="result" key="code"><Var name="code"/></Var>
	              <RollBack/>
              </Transaction>
              <Return>
                  <Var name="result"/>
              </Return>
            </Begin>
        </Function>
				{/nocache}