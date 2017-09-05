<div class="ia-item-view ia-item-view--main-info">
    <div class="row">
        <div class="col-md-7">
            {if !empty($item.pictures)}
                {ia_add_media files='fotorama'}
                <div class="ia-item-view__gallery">
                    <div class="fotorama"
                         data-nav="thumbs"
                         data-width="100%"
                         data-ratio="16/9"
                         data-allowfullscreen="true"
                         data-fit="cover">
                        {foreach $item.pictures as $entry}
                            <a class="ia-item-view__gallery__item" href="{ia_image file=$entry type='large' url=true}">{ia_image file=$entry type='large' class='img-responsive'}</a>
                        {/foreach}
                    </div>
                </div>
            {else}
                <img class="img-responsive" title="{$item.title|escape}" src="{$img}no-preview.png">
            {/if}
        </div>
        <div class="col-md-5">
            <div class="ia-item-view__info">
                {if $item.sponsored}<span class="ia-item-view__info__item"><span class="label label-warning">{lang key='sponsored'}</span></span>{/if}
                {if $item.featured}<span class="ia-item-view__info__item"><span class="label label-info">{lang key='featured'}</span></span>{/if}
                <span class="ia-item-view__info__item"><span class="fa fa-eye"></span> <b>{$item.views_num}</b></span>
                <span class="ia-item-view__info__item">{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</span>
                <span class="ia-item-view__info__item">
                    <a href="#" class="btn-compare{if ($item.compare)} btn-compare--added{/if}" data-id="{$item.id}">
                        <i class="btn-compare__icon fa fa-exchange{if ($item.compare)} text-primary{/if}"></i>
                        <span class="btn-compare__text">
                            {if $item.compare}
                                {lang key='remove_from_compare'}
                            {else}
                                {lang key='add_to_compare'}
                            {/if}
                        </span>
                    </a>
                    {ia_print_js files='_IA_URL_modules/autos/js/front/comparison'}
                </span>
            </div>
            <div class="row">
                <div class="col-sm-9">
                    <div class="ia-item-view__title">{$core.page.title|escape}</div>
                </div>
                <div class="col-sm-3">
                    <div class="ia-item-view__price">
                        {$item.price_formatted}

                        {if isset($item.average_price) && $item.price !== $item.average_price && $core.config.autos_display_average_price}
                            <div class="ia-item-view__price__average_price">
                                {if $item.price > $item.average_price}
                                    <span class="fa fa-caret-up"></span> {lang key='above_average'}
                                {else}
                                    <span class="fa fa-caret-down"></span> {lang key='below_average'}
                                {/if}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="ia-item-view__table">
                <div class="row">
                    <div class="col-md-9">
                        <table>
                            <tbody>
                            <tr>
                                <td>{lang key='field_auto_condition'}</td>
                                <td><a href="{$searchPageUrl}condition:{$item.condition}/">{lang key="field_auto_condition+{$item.condition}"}</a></td>
                            </tr>
                            {if !empty($item.mileage)}
                                <tr>
                                    <td>{lang key='field_auto_mileage'}</td>
                                    <td>{$item.mileage}</td>
                                </tr>
                            {/if}
                            <tr>
                                <td>{lang key='field_auto_engine'}</td>
                                <td>
                                    {if !empty($item.engine_type)}{lang key="field_auto_engine_type+{$item.engine_type}"}{/if}{if !empty($item.engine_size)}{$item.engine_size|escape} / {/if}
                                    {if !empty($item.engine)}{lang key="field_auto_engine+{$item.engine}"}{/if}
                                </td>
                            </tr>
                            {if !empty($item.horse_power)}
                                <tr>
                                    <td>{lang key='field_auto_horse_power'}</td>
                                    <td>{$item.horse_power|escape}</td>
                                </tr>
                            {/if}
                            {if !empty($item.transmission)}
                                <tr>
                                    <td>{lang key='field_auto_transmission'}</td>
                                    <td>{lang key="field_auto_transmission+{$item.transmission}"}</td>
                                </tr>
                            {/if}
                            <tr>
                                <td>{lang key='field_auto_body_type'}</td>
                                <td><a href="{$searchPageUrl}body:{$item.body_type}/">{lang key="field_auto_body_type+{$item.body_type}"}</a></td>
                            </tr>
                            {if !empty($item.exterior_color)}
                                <tr>
                                    <td>{lang key='field_auto_exterior_color'}</td>
                                    <td>{lang key="field_auto_exterior_color+{$item.exterior_color}"}</td>
                                </tr>
                            {/if}
                            {if !empty($item.door_count)}
                                <tr>
                                    <td>{lang key='field_auto_door_count'}</td>
                                    <td>{lang key="field_auto_door_count+{$item.door_count}"}</td>
                                </tr>
                            {/if}
                            {if !empty($item.metallic)}
                                <tr>
                                    <td>{lang key='field_auto_metallic'}</td>
                                    <td>{lang key="field_auto_metallic+{$item.metallic}"}</td>
                                </tr>
                            {/if}
                            {if !empty($item.interior_color)}
                                <tr>
                                    <td>{lang key='field_auto_interior_color'}</td>
                                    <td>{lang key="field_auto_interior_color+{$item.interior_color}"}</td>
                                </tr>
                            {/if}
                            {if !empty($item.interior_leather)}
                                <tr>
                                    <td>{lang key='field_auto_interior_leather'}</td>
                                    <td>{lang key="field_auto_interior_leather+{$item.interior_leather}"}</td>
                                </tr>
                            {/if}
                            {if !empty($item.drive_type)}
                                <tr>
                                    <td>{lang key='field_auto_drive_type'}</td>
                                    <td>{lang key="field_auto_drive_type+{$item.drive_type}"}</td>
                                </tr>
                            {/if}
                            {if !empty($item.vin_code)}
                                <tr>
                                    <td>{lang key='field_auto_vin_code'}</td>
                                    <td>{$item.vin_code|escape}</td>
                                </tr>
                            {/if}
                            {if !empty($item.fuel_type)}
                                <tr>
                                    <td>{lang key='field_auto_fuel_type'}</td>
                                    <td>
                                        {assign fuel explode(',', $item.fuel_type)}
                                        {foreach $fuel as $one}
                                            {lang key="field_auto_fuel_type+{$one}"}{if !$one@last}, {/if}
                                        {/foreach}
                                    </td>
                                </tr>
                            {/if}
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="#" class="ia-item-view__get-enquiry-form" data-toggle="modal" data-target="#enquireModal">
                    <span class="fa fa-comments-o"></span>{lang key='enquire'}
                </a>
                <div class="modal fade" id="enquireModal">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">{lang key='enquire'}</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    {include 'extra:autos/block.enquiry-form'}
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </div>
            <div class="ia-item-view--main-info__footer">
                <div class="pull-left">
                    <div class="ia-item-view__social">
                        <a href="https://www.facebook.com/sharer/sharer.php?u={$smarty.const.IA_SELF|escape:'url'}&t={$item.model}, {$item.release_year}" title="Share on Facebook" target="_blank" class="btn-social-icon btn btn-sm btn-facebook"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/intent/tweet?source={$smarty.const.IA_SELF|escape:'url'}&text={$item.model}, {$item.release_year}:{$smarty.const.IA_SELF|escape:'url'}" title="Share on Twitter" target="_blank" class="btn-social-icon btn btn-sm btn-twitter"><i class="fa fa-twitter"></i></a>
                        <a href="https://plus.google.com/share?url={$smarty.const.IA_SELF|escape:'url'}" title="Share on Google+" target="_blank" class="btn-social-icon btn btn-sm btn-google"><i class="fa fa-google-plus"></i></a>
                        <a href="mailto:?subject={$item.model},{$item.release_year}&body={$item.model}, {$item.release_year}:{$smarty.const.IA_SELF|escape:'url'}" target="_blank" title="Email" class="btn-social-icon btn btn-sm btn-email"><i class="fa fa-envelope"></i></a>
                    </div>
                </div>
                {*<div class="pull-right">*}
                    {*<div class="ia-item-view__report">*}
                        {*<span class="fa fa-exclamation-triangle"></span>*}
                        {*<a href="#">{lang key='report_listing'}</a>*}
                    {*</div>*}
                {*</div>*}
            </div>
        </div>
    </div>
</div>
