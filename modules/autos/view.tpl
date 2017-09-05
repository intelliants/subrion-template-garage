<div class="ia-item-view">
    {if !empty($item.additional_info)}
        <div class="ia-item-view__section">
            <h3>{lang key='field_auto_additional_info'}</h3>
            {$item.additional_info|escape|nl2br}
        </div>
    {/if}

    {if !empty($item.options_features)}
        <div class="ia-item-view__section">
            <h3>{lang key='options_and_features'}</h3>
            <div class="ia-item-view__features">
                <div class="row">
                    {foreach explode(',', $item.options_features) as $opt}
                        <div class="col-md-6">
                            <div class="ia-item-view__features__item"><span class="fa fa-check-circle-o"></span> {lang key="field_auto_options_features+{$opt}"}</div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}

    {ia_hooker name='smartyItemViewBeforeTabs'}

    {include 'item-view-tabs.tpl' isView=true exceptions=['model', 'price', 'release_year', 'condition', 'mileage', 'engine', 'engine_type', 'engine_size', 'horse_power', 'transmission', 'pictures', 'fuel_type', 'body_type', 'exterior_color', 'door_count', 'metallic', 'interior_color', 'interior_leather', 'drive_type', 'vin_code', 'additional_info', 'options_features'] class='ia-item-view-tabs'}

    {ia_hooker name='smartyViewListingBeforeFooter'}
</div>

{ia_add_js}
$(function() {
    $('.js-delete-listing').on('click', function(e) {
        e.preventDefault();
        intelli.confirm(_t('do_you_really_want_to_delete_listing'), { url: $(this).attr('href') });
    });
});
{/ia_add_js}