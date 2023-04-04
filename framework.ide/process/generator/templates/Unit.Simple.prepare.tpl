				{nocache}
        <Function name="prepare" doc="prepare">
            <Params/>
            <Return type="text" doc="Test documentation"/>
            <Begin>
              <!--Permissions>
                <Allow>
                  <Capability name="framework/unitTest:run"/>
                </Allow>
              </Permissions-->              
              <Var name="context" key="message">{$unitBase}::{$unitApplication}::{$unitNode}::{$unitTemplate}</Var>
              <Return>
                  <Var name="context"/>
              </Return>
            </Begin>
        </Function>   
        {/nocache}     
