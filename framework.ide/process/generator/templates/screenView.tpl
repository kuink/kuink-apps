{nocache}
<Screen name="scrView" doc="View Screen">
  <Form name="frmView">
    {foreach $attributes as $field}
    {if $field['form'] == 1}
      {if $field['datasource'] != ''}
        <Static name="{$field['name']}" datasource="{$field['datasource']}" bindid="{$field['bindid']}" bindvalue="{$field['bindvalue']}"/>
      {else}
        <Static name="{$field['name']}"/>
      {/if}
    {/if}
    {/foreach}
    <ButtonGroup>
      <Button name="back" type="back" label="back" action="search"/>
      <Button name="edit" type="update" label="edit" action="edit"/>
      <Button name="delete" type="delete" label="delete" action="delete" confirm="true"/>
    </ButtonGroup>    
  </Form>
</Screen>
{/nocache}
