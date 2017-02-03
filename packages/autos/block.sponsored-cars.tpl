{if isset($car_blocks_data.sponsored)}
	<div class="ia-items sponsored-cars">
		{foreach $car_blocks_data.sponsored as $item}
			<div class="ia-item">
				{if $item.auto_pictures}
					<a href="{$item.link}" class="ia-item__image">
						{ia_image file=$item.auto_pictures[0] width=80 title=$item.model}
					</a>
				{/if}

				<div class="ia-item__content">
					<h4 class="ia-item__title">
						<a href="{$item.link}">{$item.model}, {$item.release_year}</a>
					</h4>
					<p><span class="label label-warning">{$item.price_formatted}</span></p>
					<p class="text-fade-50">
						<a href="{$core.packages.autos.url}body-style/{$item.body_type}/">{lang key="field_autos_body_type+{$item.body_type}"}</a>,
						{lang key="field_autos_exterior_color+{$item.exterior_color}"},
						{lang key="field_autos_transmission+{$item.transmission}"},
						{if $item.engine}
							{lang key='field_autos_engine'}:
							{lang key="field_autos_engine+{$item.engine}"},
							{if $item.engine_type}{lang key="field_autos_engine_type+{$item.engine_type}"}, {/if}
							{if $item.engine_size}{$item.engine_size}{/if}
						{/if}
					</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}