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
              	<Try>
	              	<Instructions>
										<Var name="test" key="resultAdd">
											<Call library="{$unitApplication},{$unitProcess},{$unitPrefix}.aux" function="addTestData"/>
										</Var>
									</Instructions>
									<Catch>
										<!-- Exception so invalidate the test -->
									
									</Catch>
								</Try>	
								<!-- The test record has been inserted, now try to update it -->
																
								<Var name="searchResult">
									<Call library="{$apiApplication},{$apiProcess},api" function="getAll"/>
								</Var>
																
								<Var name="result" key="data"><String.parse>GetAll count: $searchResult->__length</String.parse></Var>
										
	              <If condition="$searchResult->__length &gt;= 1">
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