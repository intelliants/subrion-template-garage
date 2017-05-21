{if isset($car_blocks_data.body)}
    <div class="body-list">
        <div class="row">
            {foreach $car_blocks_data.body as $name => $entry}
                <div class="col-md-4 col-xs-6">
                    <a href="{$entry.url}" class="body-list__style body-list__style--{$name}">
                        <span></span>
                    </a>
                </div>
            {/foreach}
        </div>
    </div>
{/if}