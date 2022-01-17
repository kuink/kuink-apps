{nocache}
<Screen name="scrSearch" doc="Search Screen">
  <Form name="frmSearch" persist="true" title="search">
    {foreach $attributes as $field}
    {if $field['search'] == 1}
      {if $field['datasource'] != ''}
        <Select name="{$field['name']}" datasource="{$field['datasource']}" bindid="{$field['bindid']}" bindvalue="{$field['bindvalue']}"/>
      {else}
        <{$field['type']} id="{$field['name']}"/>
      {/if}
    {/if}
    {/foreach}
    <ButtonGroup>
      <Button name="search" type="search" label="search" action="search"/>
      <Button name="insert" type="add" label="insert" action="insert"/>
    </ButtonGroup>
  </Form>

  <Grid name="grdSearchResult" pageable="true" collapsible="false" pagesize="10" pagingaction="search" title="result">
    <Template>
      <Columns>
        {foreach $attributes as $field}
        {if $field['list'] == 1}
          {if $field['formatter'] == ''}
            {if $field['datasource'] != ''}
              <Column name="{$field['name']}" label="{$field['name']}" datasource="{$field['datasource']}" bindid="{$field['bindid']}" bindvalue="{$field['bindvalue']}"/>
            {else}
              <Column name="{$field['name']}" label="{$field['name']}"/>
            {/if}
          {else}
            {if $field['datasource'] != ''}
              <Column name="{$field['name']}" label="{$field['name']}" datasource="{$field['datasource']}" bindid="{$field['bindid']}" bindvalue="{$field['bindvalue']}">
                <Formatter name="{$field['formatter']}"/>
              </Column>
            {else}
            <Column name="{$field['name']}" label="{$field['name']}">
              <Formatter name="{$field['formatter']}"/>
            </Column>
            {/if}
          {/if}
        {/if}
        {/foreach}
      </Columns>
      <Actions separator="true">
        <Action name="view" actionvalue="id"/>
        <Action name="edit" actionvalue="id"/>
        <Action name="delete" actionvalue="id" confirm="true"/>
      </Actions>
    </Template>
  </Grid>
</Screen>
{/nocache}
