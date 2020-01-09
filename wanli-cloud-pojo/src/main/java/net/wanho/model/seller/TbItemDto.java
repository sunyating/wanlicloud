package net.wanho.model.seller;

import net.wanho.model.TbItem;

public class TbItemDto extends TbItem {
    private int sellCount;

    public TbItemDto() {
    }

    public TbItemDto(int sellCount) {
        this.sellCount = sellCount;
    }

    public int getSellCount() {
        return sellCount;
    }

    public void setSellCount(int sellCount) {
        this.sellCount = sellCount;
    }
}
