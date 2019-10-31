{nocache}
<Screen id="scrView" doc="View Screen">
  <Form name="frmView">
    {foreach $attributes as $field}
    {if $field['form'] == 1}
      {if $field['datasource'] != ''}
        <Static id="{$field['name']}" datasource="{$field['datasource']}" bindid="{$field['bindid']}" bindvalue="{$field['bindvalue']}"/>
      {else}
        <Static id="{$field['name']}"/>
      {/if}
    {/if}
    {/foreach}
    <ButtonGroup>
      <Button id="back" type="back" label="back" action="search"/>
      <Button id="edit" type="update" label="edit" action="edit"/>
      <Button id="delete" type="delete" label="delete" action="delete" confirm="true"/>
    </ButtonGroup>    
  </Form>
</Screen>
{/nocache}
