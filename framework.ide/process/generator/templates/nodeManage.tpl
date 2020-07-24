{nocache}
<?xml version="1.0" encoding="UTF-8"?>
<Node>
  <Permissions>
  </Permissions>
  <Doc lang="pt-PT">
  </Doc>
  <Libraries>
  </Libraries>
  <Configuration />
  <Screens>
    <Screen id="scrSearch" doc="Search Screen">
      <Form name="frmSearch" persist="true" title="search">
        {foreach $attributes as $field}
        {if $field['search'] == 1}
        <{$field['type']} id="{$field['name']}" label="{$field['label']}"/>
        {/if}
        {/foreach}
        <ButtonGroup>
          <Button id="search" type="search" label="search" action="search"/>
        </ButtonGroup>    
      </Form>
      
      <Grid name="grdSearchResult" pageable="true" collapsible="false" pagesize="10" pagingaction="search" title="result">
        <Template>
          <Columns>
            {foreach $attributes as $field}
            {if $field['list'] == 1}
            {if $field['formatter'] != ''}
            <Column name="{$field['name']}" label="{$field['label']}"/>
            {else}
            <Column name="{$field['name']}" label="{$field['label']}">
              <Formatter name="{$field['formatter']}"/>
            </Column>
            {/if}
            {/if}
            {/foreach}        
          </Columns>
          <Actions separator="true">
            <Action name="view" actionvalue="id"/>
            <Action name="delete" actionvalue="id"/>
          </Actions>
        </Template>
      </Grid>
    </Screen>

    <Screen id="scrView" doc="View Screen">
      <Form name="frmView">
        {foreach $attributes as $field}
        {if $field['form'] == 1}
        <Static id="{$field['name']}" label="{$field['label']}"/>
        {/if}
        {/foreach}
        <ButtonGroup>
          <Button id="back" type="back" label="back" action="search"/>
        </ButtonGroup>    
      </Form>
    </Screen>
    
    <Screen id="scrEdit" doc="Edit Screen">
      <Form name="frmEdit">
        {foreach $attributes as $field}
        {if $field['form'] == 1}
        <{$field['type']} id="{$field['name']}" label="{$field['label']}" required="{if $field['required'] == 1}true{else}false{/if}"/>
        {/if}
        {/foreach}
        <ButtonGroup>
          <Button id="cancel" type="cancel" label="cancel" action="cancel"/>
          <Button id="save" type="update" label="save" action="save"/>
        </ButtonGroup>    
      </Form>
    </Screen>        
  </Screens>
  <Actions>
    <Action name="init">
      <Action name="search"/>
    </Action>    

    <Action name="search" screen="scrSearch">
      <Var name="defaultData" key="id_legislation_status">2</Var>
      <Var name="defaultData" key="is_applicable">1</Var>
      <If condition="$defaultData->__length > 0">
        <Then>
          <Control method="setDefaultData" object="frmSearch">
            <Param><Var name="defaultData"/></Param>
          </Control>
        </Then>
      </If>
      <Var name="currentData">
        <Control method="getCurrentData" object="frmSearch"/>  
      </Var>        
      <Control method="bind" object="grdSearchResult">
        <Param>
          <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="search">
            {foreach $attributes as $field}
            {if $field['search'] == 1}
            <Param name="{$field['name']}"><Var name="currentData" key="{$field['name']}"/></Param>
            {/if}
            {/foreach}    
            <Param name="pagenize">
              <Control method="getPageSize" object="grdSearchResult"/>
            </Param>
            <Param name="pagenum">
              <Control method="getCurrentPage" object="grdSearchResult"/>
            </Param> 
          </Call>          
        </Param>
      </Control>  
    </Action>
    
    <Action name="view" screen="scrView">
      <Var name="selectedId" process="true">
        <ActionValue/>
      </Var>
      <Control method="bind" object="frmView">
        <Param>
          <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="getById">
            <Param name="id"><ActionValue/></Param>
          </Call>
        </Param>
      </Control>
    </Action>

    <Action name="insert" screen="scrEdit">
      <Var name="selectedId" process="true"><Null/></Var>      
    </Action>

    <Action name="edit" screen="scrEdit">
      <Var name="actionValue"><ActionValue/></Var>
      <If condition="$actionValue != ''">
        <Then>
          <Var name="selectedId" process="true"><ActionValue/></Var>
        </Then>
      </If>
      <Control method="bind" object="frmEdit">
        <Param>
          <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="getById">
            <Param name="id"><Var name="selectedId" process="true"/></Param>
          </Call>
        </Param>
      </Control>
    </Action>

    <Action name="save">
      <If condition="@selectedId == ''">
        <Then>
          <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="add" params="POSTDATA"/>
        </Then>
        <Else>
          <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="update" params="POSTDATA">
            <Param name="id"><Var name="selectedId" process="true"/></Param>
          </Call>    
        </Else>
      </If>
      <Action name="search"/>
    </Action>
    
    <Action name="delete">
      <Call library="{$apiApplication},{$apiProcess},{$apiNode}" function="delete">
        <Param name="id"><ActionValue/></Param>
      </Call>
      <Action name="search"/>
    </Action>

  </Actions>
</Node>
{/nocache}

