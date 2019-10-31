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
										<Var name="test" key="result">
											<Call library="{$unitApplication},{$unitProcess},{$unitPrefix}.aux" function="addTestData"/>
										</Var>
									</Instructions>
									<Catch>
										<!-- Exception so invalidate the test -->
									
									</Catch>
								</Try>	
										
	              <If condition="$test->result != ''">
	                <Then><Var name="code">0</Var></Then>
	                <Else><Var name="code">-1</Var></Else>
	              </If>
	              
	              <Var name="result" key="code"><Var name="code"/></Var>
	              <Var name="result" key="data"><String.parse>Inserted id: $test->result</String.parse></Var>
	              <RollBack/>
              </Transaction>
              <Return>
                  <Var name="result"/>
              </Return>
            </Begin>
        </Function>
        {/nocache}