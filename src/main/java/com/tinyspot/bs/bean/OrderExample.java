package com.tinyspot.bs.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrderExample() {
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

        public Criteria andOIdIsNull() {
            addCriterion("o_id is null");
            return (Criteria) this;
        }

        public Criteria andOIdIsNotNull() {
            addCriterion("o_id is not null");
            return (Criteria) this;
        }

        public Criteria andOIdEqualTo(Integer value) {
            addCriterion("o_id =", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotEqualTo(Integer value) {
            addCriterion("o_id <>", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdGreaterThan(Integer value) {
            addCriterion("o_id >", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_id >=", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdLessThan(Integer value) {
            addCriterion("o_id <", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdLessThanOrEqualTo(Integer value) {
            addCriterion("o_id <=", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdIn(List<Integer> values) {
            addCriterion("o_id in", values, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotIn(List<Integer> values) {
            addCriterion("o_id not in", values, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdBetween(Integer value1, Integer value2) {
            addCriterion("o_id between", value1, value2, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotBetween(Integer value1, Integer value2) {
            addCriterion("o_id not between", value1, value2, "oId");
            return (Criteria) this;
        }

        public Criteria andOUIdIsNull() {
            addCriterion("o_u_id is null");
            return (Criteria) this;
        }

        public Criteria andOUIdIsNotNull() {
            addCriterion("o_u_id is not null");
            return (Criteria) this;
        }

        public Criteria andOUIdEqualTo(Integer value) {
            addCriterion("o_u_id =", value, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdNotEqualTo(Integer value) {
            addCriterion("o_u_id <>", value, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdGreaterThan(Integer value) {
            addCriterion("o_u_id >", value, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_u_id >=", value, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdLessThan(Integer value) {
            addCriterion("o_u_id <", value, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdLessThanOrEqualTo(Integer value) {
            addCriterion("o_u_id <=", value, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdIn(List<Integer> values) {
            addCriterion("o_u_id in", values, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdNotIn(List<Integer> values) {
            addCriterion("o_u_id not in", values, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdBetween(Integer value1, Integer value2) {
            addCriterion("o_u_id between", value1, value2, "oUId");
            return (Criteria) this;
        }

        public Criteria andOUIdNotBetween(Integer value1, Integer value2) {
            addCriterion("o_u_id not between", value1, value2, "oUId");
            return (Criteria) this;
        }

        public Criteria andOBIdIsNull() {
            addCriterion("o_b_id is null");
            return (Criteria) this;
        }

        public Criteria andOBIdIsNotNull() {
            addCriterion("o_b_id is not null");
            return (Criteria) this;
        }

        public Criteria andOBIdEqualTo(Integer value) {
            addCriterion("o_b_id =", value, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdNotEqualTo(Integer value) {
            addCriterion("o_b_id <>", value, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdGreaterThan(Integer value) {
            addCriterion("o_b_id >", value, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_b_id >=", value, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdLessThan(Integer value) {
            addCriterion("o_b_id <", value, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdLessThanOrEqualTo(Integer value) {
            addCriterion("o_b_id <=", value, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdIn(List<Integer> values) {
            addCriterion("o_b_id in", values, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdNotIn(List<Integer> values) {
            addCriterion("o_b_id not in", values, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdBetween(Integer value1, Integer value2) {
            addCriterion("o_b_id between", value1, value2, "oBId");
            return (Criteria) this;
        }

        public Criteria andOBIdNotBetween(Integer value1, Integer value2) {
            addCriterion("o_b_id not between", value1, value2, "oBId");
            return (Criteria) this;
        }

        public Criteria andONumIsNull() {
            addCriterion("o_num is null");
            return (Criteria) this;
        }

        public Criteria andONumIsNotNull() {
            addCriterion("o_num is not null");
            return (Criteria) this;
        }

        public Criteria andONumEqualTo(Short value) {
            addCriterion("o_num =", value, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumNotEqualTo(Short value) {
            addCriterion("o_num <>", value, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumGreaterThan(Short value) {
            addCriterion("o_num >", value, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumGreaterThanOrEqualTo(Short value) {
            addCriterion("o_num >=", value, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumLessThan(Short value) {
            addCriterion("o_num <", value, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumLessThanOrEqualTo(Short value) {
            addCriterion("o_num <=", value, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumIn(List<Short> values) {
            addCriterion("o_num in", values, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumNotIn(List<Short> values) {
            addCriterion("o_num not in", values, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumBetween(Short value1, Short value2) {
            addCriterion("o_num between", value1, value2, "oNum");
            return (Criteria) this;
        }

        public Criteria andONumNotBetween(Short value1, Short value2) {
            addCriterion("o_num not between", value1, value2, "oNum");
            return (Criteria) this;
        }

        public Criteria andOStateIsNull() {
            addCriterion("o_state is null");
            return (Criteria) this;
        }

        public Criteria andOStateIsNotNull() {
            addCriterion("o_state is not null");
            return (Criteria) this;
        }

        public Criteria andOStateEqualTo(Byte value) {
            addCriterion("o_state =", value, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateNotEqualTo(Byte value) {
            addCriterion("o_state <>", value, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateGreaterThan(Byte value) {
            addCriterion("o_state >", value, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateGreaterThanOrEqualTo(Byte value) {
            addCriterion("o_state >=", value, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateLessThan(Byte value) {
            addCriterion("o_state <", value, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateLessThanOrEqualTo(Byte value) {
            addCriterion("o_state <=", value, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateIn(List<Byte> values) {
            addCriterion("o_state in", values, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateNotIn(List<Byte> values) {
            addCriterion("o_state not in", values, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateBetween(Byte value1, Byte value2) {
            addCriterion("o_state between", value1, value2, "oState");
            return (Criteria) this;
        }

        public Criteria andOStateNotBetween(Byte value1, Byte value2) {
            addCriterion("o_state not between", value1, value2, "oState");
            return (Criteria) this;
        }

        public Criteria andODateIsNull() {
            addCriterion("o_date is null");
            return (Criteria) this;
        }

        public Criteria andODateIsNotNull() {
            addCriterion("o_date is not null");
            return (Criteria) this;
        }

        public Criteria andODateEqualTo(Date value) {
            addCriterion("o_date =", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateNotEqualTo(Date value) {
            addCriterion("o_date <>", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateGreaterThan(Date value) {
            addCriterion("o_date >", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateGreaterThanOrEqualTo(Date value) {
            addCriterion("o_date >=", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateLessThan(Date value) {
            addCriterion("o_date <", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateLessThanOrEqualTo(Date value) {
            addCriterion("o_date <=", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateIn(List<Date> values) {
            addCriterion("o_date in", values, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateNotIn(List<Date> values) {
            addCriterion("o_date not in", values, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateBetween(Date value1, Date value2) {
            addCriterion("o_date between", value1, value2, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateNotBetween(Date value1, Date value2) {
            addCriterion("o_date not between", value1, value2, "oDate");
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