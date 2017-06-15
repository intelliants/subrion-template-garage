{if !empty($model)}
    <div class="page-description">{$model.description}</div>
{/if}

{if 'autos_index_member' == $core.page.name}
    {include 'extra:autos/listing-filters'}
{/if}

{if !empty($models)}
    {ia_block title={lang key='autos_models'} style='fixed' id='auto_categories'}
        <div class="ia-categories">

            {$num_columns = ((isset($core.config.autos_model_columns)) ? $core.config.autos_model_columns : 2)}
            {$class_names = ['col-md-12', 'col-md-6', 'col-md-4', 'col-md-3']}

            <div class="row ia-cats">
                {foreach $models as $model}
                <div class="{$class_names[$num_columns - 1]}">
                    <div class="ia-cat">
                        {if !empty($model.icon)}
                            {ia_image file=$model.icon type='large' title=$model.title|escape}
                        {/if}

                        <a href="{$model.link}">{$model.title|escape}</a> &mdash; {$model.num|default:0}
                    </div>
                </div>

                {if $model@iteration % $num_columns == 0 && !$model@last}
            </div>
            <div class="row ia-cats">
                {/if}
                {/foreach}
            </div>
        </div>
    {/ia_block}
{/if}

{if !empty($listings)}
    <div class="ia-cards">
        {if !isset($no_sorting)}
            <div class="ia-sorting">
                <div class="pull-left hidden-xs">
                    {lang key='total_cars_found'}: <strong>{$pagination.total}</strong>
                </div>
                <div class="pull-right">
                    <div class="ia-sorting__field">
                        {lang key='sort_by'}:
                        <div class="btn-group">
                            <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                                {if 'release_year' != $sorting.field}
                                    {lang key=$sorting.field}
                                {else}
                                    {lang key='field_autos_release_year'}
                                {/if}
                                <span class="fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="{$smarty.const.IA_SELF}?sort=title" rel="nofollow"><span class="fa fa-font"></span> {lang key='title'}</a></li>
                                <li><a href="{$smarty.const.IA_SELF}?sort=price" rel="nofollow"><span class="fa fa-dollar"></span> {lang key='price'}</a></li>
                                <li><a href="{$smarty.const.IA_SELF}?sort=year" rel="nofollow"><span class="fa fa-calendar"></span> {lang key='field_autos_release_year'}</a></li>
                                <li><a href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
                            </ul>
                        </div>
                    </div>

                    <ul class="ia-sorting__direction">
                        <li>
                            <a href="{$smarty.const.IA_SELF}?order=asc" rel="nofollow"{if $sorting.direction == 'ASC'} class="active"{/if}>
                                <span class="fa fa-sort-amount-asc"></span>
                            </a>
                        </li>
                        <li>
                            <a href="{$smarty.const.IA_SELF}?order=desc" rel="nofollow"{if $sorting.direction == 'DESC'} class="active"{/if}>
                                <span class="fa fa-sort-amount-desc"></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        {/if}

        <div class="ia-cards__items{if isset($smarty.cookies.cardsLayout) && 'list' == $smarty.cookies.cardsLayout} -list{$smarty.cookies.cardsLayout}{else} -grid{/if}">
            <div class="row">
                {foreach $listings as $listing}
                <div class="col-md-4">
                    {include 'extra:autos/list-autos'}
                </div>

                {if $listing@iteration % 3 == 0 && !$listing@last}
            </div>
            <div class="row">
                {/if}
                {/foreach}
            </div>
        </div>
    </div>

    {ia_print_js files='_IA_URL_modules/autos/js/front/index, _IA_URL_modules/autos/js/front/comparison'}

    {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aIgnore=true}
{elseif isset($model.id) && $model.level}
    <div class="alert alert-info">
        {if 'autos_search' == $core.page.name}
            {lang key='nothing_found'}
        {else}
            {lang key='no_listings_to_show'}
        {/if}
    </div>
{elseif !isset($model.id)}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}