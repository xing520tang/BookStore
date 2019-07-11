package com.tinyspot.bs.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class BookExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BookExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andBIdIsNull() {
            addCriterion("b_id is null");
            return (Criteria) this;
        }

        public Criteria andBIdIsNotNull() {
            addCriterion("b_id is not null");
            return (Criteria) this;
        }

        public Criteria andBIdEqualTo(Integer value) {
            addCriterion("b_id =", value, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdNotEqualTo(Integer value) {
            addCriterion("b_id <>", value, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdGreaterThan(Integer value) {
            addCriterion("b_id >", value, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("b_id >=", value, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdLessThan(Integer value) {
            addCriterion("b_id <", value, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdLessThanOrEqualTo(Integer value) {
            addCriterion("b_id <=", value, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdIn(List<Integer> values) {
            addCriterion("b_id in", values, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdNotIn(List<Integer> values) {
            addCriterion("b_id not in", values, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdBetween(Integer value1, Integer value2) {
            addCriterion("b_id between", value1, value2, "bId");
            return (Criteria) this;
        }

        public Criteria andBIdNotBetween(Integer value1, Integer value2) {
            addCriterion("b_id not between", value1, value2, "bId");
            return (Criteria) this;
        }

        public Criteria andBSIdIsNull() {
            addCriterion("b_s_id is null");
            return (Criteria) this;
        }

        public Criteria andBSIdIsNotNull() {
            addCriterion("b_s_id is not null");
            return (Criteria) this;
        }

        public Criteria andBSIdEqualTo(Integer value) {
            addCriterion("b_s_id =", value, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdNotEqualTo(Integer value) {
            addCriterion("b_s_id <>", value, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdGreaterThan(Integer value) {
            addCriterion("b_s_id >", value, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("b_s_id >=", value, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdLessThan(Integer value) {
            addCriterion("b_s_id <", value, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdLessThanOrEqualTo(Integer value) {
            addCriterion("b_s_id <=", value, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdIn(List<Integer> values) {
            addCriterion("b_s_id in", values, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdNotIn(List<Integer> values) {
            addCriterion("b_s_id not in", values, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdBetween(Integer value1, Integer value2) {
            addCriterion("b_s_id between", value1, value2, "bSId");
            return (Criteria) this;
        }

        public Criteria andBSIdNotBetween(Integer value1, Integer value2) {
            addCriterion("b_s_id not between", value1, value2, "bSId");
            return (Criteria) this;
        }

        public Criteria andBBcIdIsNull() {
            addCriterion("b_bc_id is null");
            return (Criteria) this;
        }

        public Criteria andBBcIdIsNotNull() {
            addCriterion("b_bc_id is not null");
            return (Criteria) this;
        }

        public Criteria andBBcIdEqualTo(Integer value) {
            addCriterion("b_bc_id =", value, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdNotEqualTo(Integer value) {
            addCriterion("b_bc_id <>", value, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdGreaterThan(Integer value) {
            addCriterion("b_bc_id >", value, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("b_bc_id >=", value, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdLessThan(Integer value) {
            addCriterion("b_bc_id <", value, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdLessThanOrEqualTo(Integer value) {
            addCriterion("b_bc_id <=", value, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdIn(List<Integer> values) {
            addCriterion("b_bc_id in", values, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdNotIn(List<Integer> values) {
            addCriterion("b_bc_id not in", values, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdBetween(Integer value1, Integer value2) {
            addCriterion("b_bc_id between", value1, value2, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBBcIdNotBetween(Integer value1, Integer value2) {
            addCriterion("b_bc_id not between", value1, value2, "bBcId");
            return (Criteria) this;
        }

        public Criteria andBNameIsNull() {
            addCriterion("b_name is null");
            return (Criteria) this;
        }

        public Criteria andBNameIsNotNull() {
            addCriterion("b_name is not null");
            return (Criteria) this;
        }

        public Criteria andBNameEqualTo(String value) {
            addCriterion("b_name =", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameNotEqualTo(String value) {
            addCriterion("b_name <>", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameGreaterThan(String value) {
            addCriterion("b_name >", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameGreaterThanOrEqualTo(String value) {
            addCriterion("b_name >=", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameLessThan(String value) {
            addCriterion("b_name <", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameLessThanOrEqualTo(String value) {
            addCriterion("b_name <=", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameLike(String value) {
            addCriterion("b_name like", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameNotLike(String value) {
            addCriterion("b_name not like", value, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameIn(List<String> values) {
            addCriterion("b_name in", values, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameNotIn(List<String> values) {
            addCriterion("b_name not in", values, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameBetween(String value1, String value2) {
            addCriterion("b_name between", value1, value2, "bName");
            return (Criteria) this;
        }

        public Criteria andBNameNotBetween(String value1, String value2) {
            addCriterion("b_name not between", value1, value2, "bName");
            return (Criteria) this;
        }

        public Criteria andBPriceIsNull() {
            addCriterion("b_price is null");
            return (Criteria) this;
        }

        public Criteria andBPriceIsNotNull() {
            addCriterion("b_price is not null");
            return (Criteria) this;
        }

        public Criteria andBPriceEqualTo(Float value) {
            addCriterion("b_price =", value, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceNotEqualTo(Float value) {
            addCriterion("b_price <>", value, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceGreaterThan(Float value) {
            addCriterion("b_price >", value, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceGreaterThanOrEqualTo(Float value) {
            addCriterion("b_price >=", value, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceLessThan(Float value) {
            addCriterion("b_price <", value, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceLessThanOrEqualTo(Float value) {
            addCriterion("b_price <=", value, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceIn(List<Float> values) {
            addCriterion("b_price in", values, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceNotIn(List<Float> values) {
            addCriterion("b_price not in", values, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceBetween(Float value1, Float value2) {
            addCriterion("b_price between", value1, value2, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBPriceNotBetween(Float value1, Float value2) {
            addCriterion("b_price not between", value1, value2, "bPrice");
            return (Criteria) this;
        }

        public Criteria andBDiscountIsNull() {
            addCriterion("b_discount is null");
            return (Criteria) this;
        }

        public Criteria andBDiscountIsNotNull() {
            addCriterion("b_discount is not null");
            return (Criteria) this;
        }

        public Criteria andBDiscountEqualTo(Float value) {
            addCriterion("b_discount =", value, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountNotEqualTo(Float value) {
            addCriterion("b_discount <>", value, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountGreaterThan(Float value) {
            addCriterion("b_discount >", value, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountGreaterThanOrEqualTo(Float value) {
            addCriterion("b_discount >=", value, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountLessThan(Float value) {
            addCriterion("b_discount <", value, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountLessThanOrEqualTo(Float value) {
            addCriterion("b_discount <=", value, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountIn(List<Float> values) {
            addCriterion("b_discount in", values, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountNotIn(List<Float> values) {
            addCriterion("b_discount not in", values, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountBetween(Float value1, Float value2) {
            addCriterion("b_discount between", value1, value2, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBDiscountNotBetween(Float value1, Float value2) {
            addCriterion("b_discount not between", value1, value2, "bDiscount");
            return (Criteria) this;
        }

        public Criteria andBStockIsNull() {
            addCriterion("b_stock is null");
            return (Criteria) this;
        }

        public Criteria andBStockIsNotNull() {
            addCriterion("b_stock is not null");
            return (Criteria) this;
        }

        public Criteria andBStockEqualTo(Short value) {
            addCriterion("b_stock =", value, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockNotEqualTo(Short value) {
            addCriterion("b_stock <>", value, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockGreaterThan(Short value) {
            addCriterion("b_stock >", value, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockGreaterThanOrEqualTo(Short value) {
            addCriterion("b_stock >=", value, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockLessThan(Short value) {
            addCriterion("b_stock <", value, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockLessThanOrEqualTo(Short value) {
            addCriterion("b_stock <=", value, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockIn(List<Short> values) {
            addCriterion("b_stock in", values, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockNotIn(List<Short> values) {
            addCriterion("b_stock not in", values, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockBetween(Short value1, Short value2) {
            addCriterion("b_stock between", value1, value2, "bStock");
            return (Criteria) this;
        }

        public Criteria andBStockNotBetween(Short value1, Short value2) {
            addCriterion("b_stock not between", value1, value2, "bStock");
            return (Criteria) this;
        }

        public Criteria andBAuthorIsNull() {
            addCriterion("b_author is null");
            return (Criteria) this;
        }

        public Criteria andBAuthorIsNotNull() {
            addCriterion("b_author is not null");
            return (Criteria) this;
        }

        public Criteria andBAuthorEqualTo(String value) {
            addCriterion("b_author =", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorNotEqualTo(String value) {
            addCriterion("b_author <>", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorGreaterThan(String value) {
            addCriterion("b_author >", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorGreaterThanOrEqualTo(String value) {
            addCriterion("b_author >=", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorLessThan(String value) {
            addCriterion("b_author <", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorLessThanOrEqualTo(String value) {
            addCriterion("b_author <=", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorLike(String value) {
            addCriterion("b_author like", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorNotLike(String value) {
            addCriterion("b_author not like", value, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorIn(List<String> values) {
            addCriterion("b_author in", values, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorNotIn(List<String> values) {
            addCriterion("b_author not in", values, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorBetween(String value1, String value2) {
            addCriterion("b_author between", value1, value2, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBAuthorNotBetween(String value1, String value2) {
            addCriterion("b_author not between", value1, value2, "bAuthor");
            return (Criteria) this;
        }

        public Criteria andBPressIsNull() {
            addCriterion("b_press is null");
            return (Criteria) this;
        }

        public Criteria andBPressIsNotNull() {
            addCriterion("b_press is not null");
            return (Criteria) this;
        }

        public Criteria andBPressEqualTo(String value) {
            addCriterion("b_press =", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressNotEqualTo(String value) {
            addCriterion("b_press <>", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressGreaterThan(String value) {
            addCriterion("b_press >", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressGreaterThanOrEqualTo(String value) {
            addCriterion("b_press >=", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressLessThan(String value) {
            addCriterion("b_press <", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressLessThanOrEqualTo(String value) {
            addCriterion("b_press <=", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressLike(String value) {
            addCriterion("b_press like", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressNotLike(String value) {
            addCriterion("b_press not like", value, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressIn(List<String> values) {
            addCriterion("b_press in", values, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressNotIn(List<String> values) {
            addCriterion("b_press not in", values, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressBetween(String value1, String value2) {
            addCriterion("b_press between", value1, value2, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPressNotBetween(String value1, String value2) {
            addCriterion("b_press not between", value1, value2, "bPress");
            return (Criteria) this;
        }

        public Criteria andBPubDateIsNull() {
            addCriterion("b_pub_date is null");
            return (Criteria) this;
        }

        public Criteria andBPubDateIsNotNull() {
            addCriterion("b_pub_date is not null");
            return (Criteria) this;
        }

        public Criteria andBPubDateEqualTo(Date value) {
            addCriterionForJDBCDate("b_pub_date =", value, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("b_pub_date <>", value, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateGreaterThan(Date value) {
            addCriterionForJDBCDate("b_pub_date >", value, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("b_pub_date >=", value, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateLessThan(Date value) {
            addCriterionForJDBCDate("b_pub_date <", value, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("b_pub_date <=", value, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateIn(List<Date> values) {
            addCriterionForJDBCDate("b_pub_date in", values, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("b_pub_date not in", values, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("b_pub_date between", value1, value2, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPubDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("b_pub_date not between", value1, value2, "bPubDate");
            return (Criteria) this;
        }

        public Criteria andBPictureIsNull() {
            addCriterion("b_picture is null");
            return (Criteria) this;
        }

        public Criteria andBPictureIsNotNull() {
            addCriterion("b_picture is not null");
            return (Criteria) this;
        }

        public Criteria andBPictureEqualTo(String value) {
            addCriterion("b_picture =", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureNotEqualTo(String value) {
            addCriterion("b_picture <>", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureGreaterThan(String value) {
            addCriterion("b_picture >", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureGreaterThanOrEqualTo(String value) {
            addCriterion("b_picture >=", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureLessThan(String value) {
            addCriterion("b_picture <", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureLessThanOrEqualTo(String value) {
            addCriterion("b_picture <=", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureLike(String value) {
            addCriterion("b_picture like", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureNotLike(String value) {
            addCriterion("b_picture not like", value, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureIn(List<String> values) {
            addCriterion("b_picture in", values, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureNotIn(List<String> values) {
            addCriterion("b_picture not in", values, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureBetween(String value1, String value2) {
            addCriterion("b_picture between", value1, value2, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBPictureNotBetween(String value1, String value2) {
            addCriterion("b_picture not between", value1, value2, "bPicture");
            return (Criteria) this;
        }

        public Criteria andBStateIsNull() {
            addCriterion("b_state is null");
            return (Criteria) this;
        }

        public Criteria andBStateIsNotNull() {
            addCriterion("b_state is not null");
            return (Criteria) this;
        }

        public Criteria andBStateEqualTo(Byte value) {
            addCriterion("b_state =", value, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateNotEqualTo(Byte value) {
            addCriterion("b_state <>", value, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateGreaterThan(Byte value) {
            addCriterion("b_state >", value, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateGreaterThanOrEqualTo(Byte value) {
            addCriterion("b_state >=", value, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateLessThan(Byte value) {
            addCriterion("b_state <", value, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateLessThanOrEqualTo(Byte value) {
            addCriterion("b_state <=", value, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateIn(List<Byte> values) {
            addCriterion("b_state in", values, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateNotIn(List<Byte> values) {
            addCriterion("b_state not in", values, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateBetween(Byte value1, Byte value2) {
            addCriterion("b_state between", value1, value2, "bState");
            return (Criteria) this;
        }

        public Criteria andBStateNotBetween(Byte value1, Byte value2) {
            addCriterion("b_state not between", value1, value2, "bState");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}