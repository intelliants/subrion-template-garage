{if !empty($car_blocks_data.serviceCategories)}
    <div class="ia-categories">
        <div class="row ia-cats">
            {foreach $car_blocks_data.serviceCategories as $name => $entry}
                <div class="col-md-4">
                    <div class="ia-cat">
                        <a href="{$core.packages.autos.url}services/{$entry.alias}">{$entry.title|escape}</a>
                    </div>
                </div>

                {if $entry@iteration % 3 == 0 && !$entry@last}
                    </div>
                    <div class="row ia-cats">
                {/if}
            {/foreach}
        </div>
    </div>
{/if}