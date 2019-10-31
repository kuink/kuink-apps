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
              <Var name="result" key="code"><Int>0</Int></Var>
              <Var name="result" key="data"><String/></Var>
              <Return>
                  <Var name="result"/>
              </Return>
            </Begin>
        </Function>
        {/nocache}