{nocache}
<?xml version="1.0" encoding="UTF-8"?>
<Method>
    <Doc>
        Search all {$entity}
    </Doc>
    <Params>
    {foreach $attributes as $field}
    {if $field['search'] == 1}
      <Param name="{$field['name']}"/>
    {/if}
    {/foreach}
    </Params>
    <Body>
        <SqlPaginated>
            <XSql>
                <XSelect>
                    <XField >
                        *
                    </XField>
                </XSelect>
                <XFrom>
                    <XTable>
                        {$entity} t
                    </XTable>
                </XFrom>
                <XWhere>
                  <XCondition>1 = 1</XCondition>
                  {foreach $attributes as $field}
                  {$operator = "="}
                  {$valueDelim = ""}
                  {if $field['type'] == 'Text'}
                    {$operator = "like"}
                    {$valueDelim = "'"}
                  {/if}
                  {if $field['search'] == 1}
                    <XCondition optional="{$field['name']}">AND t.{$field['name']} {$operator} {$valueDelim}{ldelim}param->{$field['name']}{rdelim}{$valueDelim}</XCondition>
                  {/if}
                  {/foreach}
                </XWhere>
            </XSql>
        </SqlPaginated>
    </Body>
</Method>
{/nocache}
