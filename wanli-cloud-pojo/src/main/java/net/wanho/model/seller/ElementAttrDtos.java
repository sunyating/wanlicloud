package net.wanho.model.seller;

import net.wanho.model.TbProductsElement;
import net.wanho.model.TbProductsElementsAttr;

import java.util.List;

public class ElementAttrDtos extends TbProductsElement {
    private List<TbProductsElementsAttr> tbProductsElementsAttrs;

    public ElementAttrDtos() {
    }

    public List<TbProductsElementsAttr> getTbProductsElementsAttrs() {
        return tbProductsElementsAttrs;
    }

    public void setTbProductsElementsAttrs(List<TbProductsElementsAttr> tbProductsElementsAttrs) {
        this.tbProductsElementsAttrs = tbProductsElementsAttrs;
    }

    public ElementAttrDtos(List<TbProductsElementsAttr> tbProductsElementsAttrs) {
        this.tbProductsElementsAttrs = tbProductsElementsAttrs;
    }
}
