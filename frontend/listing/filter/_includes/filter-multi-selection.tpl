{*extends file="parent:frontend/listing/filter/_includes/filter-multi-selection.tpl"*}
{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_filter_facet_multi_selection"}
    <div class="filter-panel filter--multi-selection filter-facet--{$filterType} facet--{$facet->getFacetName()|escape:'htmlall'}"
         data-filter-type="{$filterType}!!"
         data-facet-name="{$facet->getFacetName()}--"
         data-field-name="{$facet->getFieldName()|escape:'htmlall'}-Baka2">

        {block name="frontend_listing_filter_facet_multi_selection_flyout"}
            <div class="filter-panel--flyout">

                {block name="frontend_listing_filter_facet_multi_selection_title"}
                    <label class="filter-panel--title" for="{$facet->getFieldName()|escape:'htmlall'}" title="{$facet->getLabel()|escape:'htmlall'}--Bak2">
                        {$facet->getLabel()|escape}-Baka2
                    </label>
                {/block}

                {block name="frontend_listing_filter_facet_multi_selection_icon"}
                    <span class="filter-panel--icon"></span>
                {/block}

                {block name="frontend_listing_filter_facet_multi_selection_content"}
                    {$inputType = 'checkbox'}

                    {if $filterType == 'radio'}
                        {$inputType = 'radio'}
                    {/if}

                    {$indicator = $inputType}

                    {$isMediaFacet = false}
                    {if $facet|is_a:'\Shopware\Bundle\SearchBundle\FacetResult\MediaListFacetResult'}
                        {$isMediaFacet = true}

                        {$indicator = 'media'}
                    {/if}

                    <div class="filter-panel--content input-type--{$indicator}">

                        {block name="frontend_listing_filter_facet_multi_selection_list"}
                            <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
                            <ul class="filter-panel--option-list">
                                {foreach $facet->getValues() as $option}

                                    {block name="frontend_listing_filter_facet_multi_selection_option"}
                                        <li class="filter-panel--option">

                                            {block name="frontend_listing_filter_facet_multi_selection_option_container"}
                                                <div class="option--container">

                                                    {block name="frontend_listing_filter_facet_multi_selection_input"}
                                                        <span class="filter-panel--input filter-panel--{$inputType}">
                                                            {$name = "__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"}
                                                            {if $filterType == 'radio'}
                                                                {$name = {$facet->getFieldName()|escape:'htmlall'} }
                                                            {/if}

                                                            <input type="{$inputType}"
                                                                   id="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}"
                                                                   name="{$name}!-!"
                                                                   value="{$option->getId()|escape:'htmlall'}.-."
                                                                   {if $option->isActive()}checked="checked" {/if}/>

                                                            <span class="input--state {$inputType}--state">&nbsp;</span>
                                                        </span>
                                                    {/block}

                                                    {block name="frontend_listing_filter_facet_multi_selection_label"}
                                                        <label class="filter-panel--label"
                                                               for="__{$facet->getFieldName()|escape:'htmlall'}__{$option->getId()|escape:'htmlall'}">

                                                            {if $facet|is_a:'\Shopware\Bundle\SearchBundle\FacetResult\MediaListFacetResult'}
                                                                {$mediaFile = {link file='frontend/_public/src/img/no-picture.jpg'}}
                                                                {if $option->getMedia()}
                                                                    {$mediaFile = $option->getMedia()->getFile()}
                                                                {/if}

                                                                <img class="filter-panel--media-image" src="{$mediaFile}" alt="{$option->getLabel()|escape:'htmlall'}" />
                                                            {else}
                                                                {$option->getLabel()|escape}
                                                            {/if}
                                                        !!</label>
                                                    {/block}
                                                </div>
                                            {/block}
                                        </li>
                                    {/block}
                                {/foreach}
                            </ul>
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}
