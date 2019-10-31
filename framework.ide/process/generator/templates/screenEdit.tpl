{nocache}
<Screen id="scrEdit" doc="Edit Screen">
  <Form name="frmEdit">
    {foreach $attributes as $field}
    {if $field['form'] == 1}
      {if $field['datasource'] != ''}
        <{if $field['key']=='PRI'}Static{else}Select{/if} id="{$field['name']}" label="{$field['name']}" required="{$field['required']}" datasource="{$field['datasource']}" bindid="{$field['bindid']}" bindvalue="{$field['bindvalue']}"/>
      {else}
        <{if $field['key']=='PRI'}Static{else}{$field['type']}{/if}  id="{$field['name']}" label="{$field['name']}" required="{$field['required']}"/>
      {/if}
    {/if}
    {/foreach}
    <ButtonGroup>
      <Button id="cancel" type="cancel" label="cancel" action="search"/>
      <Button id="save" type="update" label="save" action="save"/>
    </ButtonGroup>    
  </Form>
</Screen>
{/nocache}
