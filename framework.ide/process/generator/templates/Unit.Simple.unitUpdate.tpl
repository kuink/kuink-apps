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
											<Call library="{$unitApplication},{$unitProcess},{$unitPrefix}.aux" function="addTestData"/>
										</Var>
									</Instructions>
									<Catch>
										<!-- Exception so invalidate the test -->
									
									</Catch>
								</Try>	
								<!-- The test record has been inserted, now try to update it -->
								
								<Var name="newData"><Set/></Var>
								<Var name="newData" key="id"><Var name="test" key="resultAdd"/></Var>    
					      {foreach $attributes as $field}
					        {if ($field['key'] != 'PRI' && $field['name'] !='' && $field['name'][0] != '_' && $field['name'] != 'id_company')}
					           <Var name="newData" key="{$field['name']}">
					           	{if ($field['type'] == 'Int' || $field['type'] == 'Checkbox' || $field['type'] == 'Select') }
					           		<Int>2</Int>
					           		{else}
							           	{if ($field['type'] == 'Date' || $field['type'] == 'DateTime') }
							           		<Now/>
							           	{else}
														<String>B</String>		           	
							           	{/if}
					           	{/if}
					           </Var>
					        {/if}
					      {/foreach}
								
								<Var name="test" key="resultUpdate">
									<Call library="{$apiApplication},{$apiProcess},api" function="update" params="newData"/>
								</Var>
																
								<!-- Check if the updated data is the same as the one being updated -->
								<Var name="record">
									<Call library="{$apiApplication},{$apiProcess},api" function="getById">
										<Param name="id"><Var name="test" key="resultAdd"/></Param>
									</Call>
								</Var>
								<Var name="allOk"><Int>1</Int></Var>
					      {foreach $attributes as $field}
					        {if ($field['key'] != 'PRI' && $field['name'] !='' && $field['name'][0] != '_' && $field['name'] != 'id_company')}
					        	 <Var name="testValue">
					           	{if ($field['type'] == 'Int' || $field['type'] == 'Checkbox' || $field['type'] == 'Select') }
					           		<Int>2</Int>
					           		{else}
							           	{if ($field['type'] == 'Date' || $field['type'] == 'DateTime') }
							           		<Now/>
							           	{else}
														<String>B</String>		           	
							           	{/if}
					           	{/if}
					           </Var>
					           <Var name="testField"><Var name="newData" key="{$field['name']}"/></Var>
					           <If condition="$testField != $testValue">
					           	<Then><Var name="allOk"><Int>0</Int></Var></Then>
					           </If>
					        {/if}
					      {/foreach}
								
								<Var name="result" key="data"><String/></Var>
								
										
	              <If condition="$allOk == 1">
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