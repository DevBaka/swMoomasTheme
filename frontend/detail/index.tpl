{extends file="parent:frontend/detail/index.tpl"}
{block name="frontend_index_content_right"}
    {block name="frontend_detail_index_navigation"}
        {$smarty.block.parent}
    {/block}
    Hello world
    {$smarty.block.parent}

{/block}