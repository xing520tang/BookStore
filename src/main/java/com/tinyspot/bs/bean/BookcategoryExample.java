package com.tinyspot.bs.bean;

import java.util.ArrayList;
import java.util.List;

public class BookcategoryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BookcategoryExample() {
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

        public Criteria andBcIdIsNull() {
            addCriterion("bc_id is null");
            return (Criteria) this;
        }

        public Criteria andBcIdIsNotNull() {
            addCriterion("bc_id is not null");
            return (Criteria) this;
        }

        public Criteria andBcIdEqualTo(Integer value) {
            addCriterion("bc_id =", value, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdNotEqualTo(Integer value) {
            addCriterion("bc_id <>", value, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdGreaterThan(Integer value) {
            addCriterion("bc_id >", value, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("bc_id >=", value, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdLessThan(Integer value) {
            addCriterion("bc_id <", value, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdLessThanOrEqualTo(Integer value) {
            addCriterion("bc_id <=", value, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdIn(List<Integer> values) {
            addCriterion("bc_id in", values, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdNotIn(List<Integer> values) {
            addCriterion("bc_id not in", values, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdBetween(Integer value1, Integer value2) {
            addCriterion("bc_id between", value1, value2, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcIdNotBetween(Integer value1, Integer value2) {
            addCriterion("bc_id not between", value1, value2, "bcId");
            return (Criteria) this;
        }

        public Criteria andBcNameIsNull() {
            addCriterion("bc_name is null");
            return (Criteria) this;
        }

        public Criteria andBcNameIsNotNull() {
            addCriterion("bc_name is not null");
            return (Criteria) this;
        }

        public Criteria andBcNameEqualTo(String value) {
            addCriterion("bc_name =", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameNotEqualTo(String value) {
            addCriterion("bc_name <>", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameGreaterThan(String value) {
            addCriterion("bc_name >", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameGreaterThanOrEqualTo(String value) {
            addCriterion("bc_name >=", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameLessThan(String value) {
            addCriterion("bc_name <", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameLessThanOrEqualTo(String value) {
            addCriterion("bc_name <=", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameLike(String value) {
            addCriterion("bc_name like", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameNotLike(String value) {
            addCriterion("bc_name not like", value, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameIn(List<String> values) {
            addCriterion("bc_name in", values, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameNotIn(List<String> values) {
            addCriterion("bc_name not in", values, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameBetween(String value1, String value2) {
            addCriterion("bc_name between", value1, value2, "bcName");
            return (Criteria) this;
        }

        public Criteria andBcNameNotBetween(String value1, String value2) {
            addCriterion("bc_name not between", value1, value2, "bcName");
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