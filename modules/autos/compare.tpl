{if !empty($items)}
    <div class="ia-compare">
        <div class="ia-compare__table table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>{lang key='details'}</th>
                    {foreach $items as $item}
                        <th width="{$thumbnail.width}">
                            <div class="ia-compare__table__image">
                                <a href="{$item.link}">
                                    {if $item.pictures}
                                        {ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}
                                    {else}
                                        <img src="{$img}no-preview.png" width="{$thumbnail.width}" alt="{$item.model|escape}">
                                    {/if}
                                </a>
                            </div>
                            <div class="ia-compare__table__title">
                                {$item.model|escape}
                                <a class="btn-compare btn-compare--added" href="#" data-id="{$item.id}" title="{lang key='remove_from_compare'}"><span class="fa fa-times"></span></a>
                            </div>
                        </th>
                    {/foreach}
                </tr>
                </thead>
                <tbody>
                {foreach $fields as $field}
                    {if 'pictures' !== $field.name}
                        <tr>
                            <td>{$field.title|escape}</td>
                            {foreach $items as $item}
                                <td>{include 'field-type-content-view.tpl'}</td>
                            {/foreach}
                        </tr>
                    {/if}
                {/foreach}
                </tbody>
            </table>
        </div>
        <div class="ia-compare__actions">
            <a href="#" class="btn btn-default" onclick="history.back(-1)"><span class="fa fa-chevron-left"></span> {lang key='back'}</a>
            <a href="#" class="btn btn-info" onclick="window.print(); return false;"><span class="fa fa-print"></span> {lang key='print'}</a>
        </div>
    </div>
    {ia_print_js files='_IA_URL_modules/autos/js/front/comparison'}
{else}
    <div class="alert alert-info">{lang key='no_listings_selected_to_compare'}</div>
{/if}