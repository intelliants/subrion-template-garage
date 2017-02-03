<div class="ia-card ia-item--{$listing.status} {if 'hidden' == $listing.status}-hidden{/if} {if $listing.featured}-featured{/if} {if $listing.sponsored}-sponsored{/if}">
	{if $listing.featured}
		<div class="ia-card__badge ia-card__badge--featured" title="{lang key='featured'}">{lang key='featured'}</div>
	{/if}
	{if $listing.sponsored}
		<div class="ia-card__badge ia-card__badge--sponsored" title="{lang key='sponsored'}">{lang key='sponsored'}</div>
	{/if}
	{if $member && $member.id == $listing.member_id && 'active' != $listing.status}
		<span class="label label-status label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}">{lang key=$listing.status default=$listing.status}</span>
	{/if}

	{if $listing.auto_pictures}
		<a class="ia-card__image" href="{ia_url item='autos' type='url' data=$listing}">
			{ia_image file=$listing.auto_pictures[0] title="{$listing.model|escape:'html'} {$listing.release_year}" class='img-responsive'}
		</a>
	{/if}

	<div class="ia-card__content">
		<div class="ia-card__content__left">
			<div class="ia-card__title" href="{$listing.link}"><strong>{$listing.make}</strong> {$listing.make_model}</div>
			<div class="ia-card__info">
				{$listing.release_year}{if $listing.transmission}, {$listing.transmission}{/if}{if $listing.mileage}, {intval($listing.mileage)}k+ {lang key='unit'}{/if}
			</div>
		</div>
		<div class="ia-card__content__right">
			{if $listing.price}
				<div class="ia-card__price">
					{$core.config.currency} {$listing.price}
					{if isset($listing.average_price) && $listing.price !== $listing.average_price && $core.config.autos_display_average_price}
						<div class="ia-card__average-price">
							{if $listing.price > $listing.average_price}
								(<span class="fa fa-arrow-up"></span> {lang key='above_average'} {$core.config.currency} {$listing.average_price})
							{else}
								(<span class="fa fa-arrow-down"></span> {lang key='below_average'} {$core.config.currency} {$listing.average_price})
							{/if}
						</div>
					{/if}
				</div>
			{/if}

			{if $listing.exterior_color}
				<div class="ia-card__color" style="width:10px;height:10px;border:1px solid #b5b5b5;background-color:{$listing.exterior_color};"></div>
			{/if}
		</div>
	</div>

	{if 'favorites' != $core.page.name}
		<div class="ia-item__comparison-controls m-t">
			<a href="#" class="btn-compare{if ($listing.compare)} btn-compare--added{/if} pull-right" data-id="{$listing.id}">
				<i class="btn-compare__icon fa fa-exchange{if ($listing.compare)} text-primary{/if}"></i>
				<span class="btn-compare__text">
					{if ($listing.compare)}
						{lang key='remove_from_compare'}
					{else}
						{lang key='add_to_compare'}
					{/if}
				</span>
			</a>
			{ia_print_js files='_IA_URL_packages/autos/js/front/comparison'}
		</div>
	{/if}
</div>