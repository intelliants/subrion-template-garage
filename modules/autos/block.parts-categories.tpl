{if !empty($car_blocks_data.partCategories)}
    <div class="ia-categories">
        <div class="row ia-cats">
            {foreach $car_blocks_data.partCategories as $name => $entry}
                <div class="col-md-6">
                    <div class="ia-cat">
                        <a href="{$core.packages.autos.url}parts/{$entry.alias}">{$entry.title|escape}</a>
                    </div>
                </div>

                {if $entry@iteration % 2 == 0 && !$entry@last}
                    </div>
                    <div class="row ia-cats">
                {/if}
            {/foreach}
        </div>
    </div>
{/if}