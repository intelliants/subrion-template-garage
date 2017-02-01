<form class="q-search{if 'index' != $core.page.name} q-search--inner{/if}" action="{$smarty.const.IA_URL}search/cars/">
	<div class="well clearfix">
		<div class="col-md-3">
			<select class="form-control js-car-make" name="mk">
				<option value="">{lang key='make'}</option>
				{foreach $car_blocks_data.search.categories as $item}
					<option value="{$item.id}"{if isset($smarty.get.mk) && $smarty.get.mk == $item.id} selected{/if}>{$item.name|escape:'html'}</option>
				{/foreach}
			</select>
		</div>
		<div class="col-md-3">
			<select name="md" class="form-control js-car-model" data-spinner=".q-search__loader">
				<option value="">{lang key='model'}</option>
			</select>
		</div>
		<div class="col-md-3">
			<select class="form-control" name="body">
				<option value="">{lang key='field_body_type'}</option>
				{foreach $car_blocks_data.search.body_types as $key => $value}
					<option value="{$key}"{if isset($smarty.get.body) && $smarty.get.body == $key} selected{/if}>{$value}</option>
				{/foreach}
			</select>
		</div>
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-7">
					{if $max_auto_price}
						<input class="hidden js-range-slider" type="hidden">

						<input type="hidden" name="price[f]" value="0">
						<input type="hidden" name="price[t]" value="{$max_auto_price}">
					{/if}
				</div>
				<div class="col-md-5">
					<button class="btn btn-dark btn-block" type="submit">{lang key='search'}</button>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix">
		<div class="pull-left">
			<a href="{$core.packages.autos.url}add/">{lang key='sell_a_car'}</a>
			<span>{lang key='counter' counter={$num_autos}}</span>
		</div>
		<div class="pull-right">
			<a href="{$core.packages.autos.url}autos/">{lang key='advanced_search'}</a>
		</div>
	</div>
</form>
{ia_add_media files='js:_IA_URL_packages/autos/js/front/search, js:_IA_TPL_ion.rangeSlider.min, css:ion.rangeSlider'}

{ia_add_js}
	$(function() {
		$('.js-range-slider').ionRangeSlider(
		{
			type: 'double',
			force_edges: true,
			min: 0,
			max: {if $max_auto_price}{$max_auto_price}{else}0{/if},
			from: 0,
			to: {if $max_auto_price}{$max_auto_price}{else}0{/if},
			onFinish: function(data)
			{
				$('input[name="price[f]"]').val(data.from);
				$('input[name="price[t]"]').val(data.to);
			}
		});

		var $form = $('.q-search', 'form'),
		buttonText = $form.find('button').html();

		$form.change(function()
		{
			var $this = $(this);

			$.post(intelli.config.ia_url + 'autos.json', { data: $form.serialize(), action: 'quicksearch_total' }).done(function(response)
			{
				var count = 0;

				if (typeof response.count !== 'boolean' || typeof response.count !== 'undefined')
				{
					count = response.count;
				}

				$this.find('button').html(buttonText + ' (' + count + ')');
			});
		});
	});
{/ia_add_js}