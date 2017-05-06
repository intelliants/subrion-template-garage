{if !empty($categories)}
    {$num_columns = ((isset($num_columns)) ? $num_columns : 2)}
    {$class_names = ['col-md-12', 'col-md-6', 'col-md-4', 'col-md-3']}

    <div class="row ia-cats">
    {foreach $categories as $category}
        <div class="{$class_names[$num_columns - 1]}">
            <div class="ia-cat">
                {if !empty($icons)}
                    {if !empty($category.icon)}
                        <a href="{$category.url}">
                            <img src="{ia_image url=$category.icon type='thumbnail'}" alt="{$category.title|escape}" class="img-responsive">
                        </a>
                    {else}
                        <span class="fa fa-folder-open"></span>
                    {/if}
                {/if}

                <a href="{$category.url}">{$category.title|escape}</a>
                {if !empty($show_amount)}
                    &mdash; {$category.num|default:0}
                {/if}

                {if !empty($category.subcategories)}
                    <div class="ia-cat__sub">
                        {foreach $category.subcategories as $subcategory}
                            <a href="{ia_url type='url' item=$item data=$subcategory}">{$subcategory.title|escape}</a>{if !$subcategory@last}, {/if}
                        {/foreach}
                    </div>
                {/if}
            </div>
        </div>

        {if $category@iteration % $num_columns == 0 && !$category@last}
            </div>
            <div class="row ia-cats">
        {/if}
    {/foreach}
    </div>
{/if}