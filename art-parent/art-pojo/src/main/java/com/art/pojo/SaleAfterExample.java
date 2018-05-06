package com.art.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SaleAfterExample implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SaleAfterExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andFormidIsNull() {
            addCriterion("formId is null");
            return (Criteria) this;
        }

        public Criteria andFormidIsNotNull() {
            addCriterion("formId is not null");
            return (Criteria) this;
        }

        public Criteria andFormidEqualTo(String value) {
            addCriterion("formId =", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidNotEqualTo(String value) {
            addCriterion("formId <>", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidGreaterThan(String value) {
            addCriterion("formId >", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidGreaterThanOrEqualTo(String value) {
            addCriterion("formId >=", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidLessThan(String value) {
            addCriterion("formId <", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidLessThanOrEqualTo(String value) {
            addCriterion("formId <=", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidLike(String value) {
            addCriterion("formId like", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidNotLike(String value) {
            addCriterion("formId not like", value, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidIn(List<String> values) {
            addCriterion("formId in", values, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidNotIn(List<String> values) {
            addCriterion("formId not in", values, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidBetween(String value1, String value2) {
            addCriterion("formId between", value1, value2, "formid");
            return (Criteria) this;
        }

        public Criteria andFormidNotBetween(String value1, String value2) {
            addCriterion("formId not between", value1, value2, "formid");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andOnemoneyIsNull() {
            addCriterion("onemoney is null");
            return (Criteria) this;
        }

        public Criteria andOnemoneyIsNotNull() {
            addCriterion("onemoney is not null");
            return (Criteria) this;
        }

        public Criteria andOnemoneyEqualTo(String value) {
            addCriterion("onemoney =", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyNotEqualTo(String value) {
            addCriterion("onemoney <>", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyGreaterThan(String value) {
            addCriterion("onemoney >", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyGreaterThanOrEqualTo(String value) {
            addCriterion("onemoney >=", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyLessThan(String value) {
            addCriterion("onemoney <", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyLessThanOrEqualTo(String value) {
            addCriterion("onemoney <=", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyLike(String value) {
            addCriterion("onemoney like", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyNotLike(String value) {
            addCriterion("onemoney not like", value, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyIn(List<String> values) {
            addCriterion("onemoney in", values, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyNotIn(List<String> values) {
            addCriterion("onemoney not in", values, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyBetween(String value1, String value2) {
            addCriterion("onemoney between", value1, value2, "onemoney");
            return (Criteria) this;
        }

        public Criteria andOnemoneyNotBetween(String value1, String value2) {
            addCriterion("onemoney not between", value1, value2, "onemoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyIsNull() {
            addCriterion("summoney is null");
            return (Criteria) this;
        }

        public Criteria andSummoneyIsNotNull() {
            addCriterion("summoney is not null");
            return (Criteria) this;
        }

        public Criteria andSummoneyEqualTo(String value) {
            addCriterion("summoney =", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyNotEqualTo(String value) {
            addCriterion("summoney <>", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyGreaterThan(String value) {
            addCriterion("summoney >", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyGreaterThanOrEqualTo(String value) {
            addCriterion("summoney >=", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyLessThan(String value) {
            addCriterion("summoney <", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyLessThanOrEqualTo(String value) {
            addCriterion("summoney <=", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyLike(String value) {
            addCriterion("summoney like", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyNotLike(String value) {
            addCriterion("summoney not like", value, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyIn(List<String> values) {
            addCriterion("summoney in", values, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyNotIn(List<String> values) {
            addCriterion("summoney not in", values, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyBetween(String value1, String value2) {
            addCriterion("summoney between", value1, value2, "summoney");
            return (Criteria) this;
        }

        public Criteria andSummoneyNotBetween(String value1, String value2) {
            addCriterion("summoney not between", value1, value2, "summoney");
            return (Criteria) this;
        }

        public Criteria andDescripteIsNull() {
            addCriterion("descripte is null");
            return (Criteria) this;
        }

        public Criteria andDescripteIsNotNull() {
            addCriterion("descripte is not null");
            return (Criteria) this;
        }

        public Criteria andDescripteEqualTo(String value) {
            addCriterion("descripte =", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteNotEqualTo(String value) {
            addCriterion("descripte <>", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteGreaterThan(String value) {
            addCriterion("descripte >", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteGreaterThanOrEqualTo(String value) {
            addCriterion("descripte >=", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteLessThan(String value) {
            addCriterion("descripte <", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteLessThanOrEqualTo(String value) {
            addCriterion("descripte <=", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteLike(String value) {
            addCriterion("descripte like", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteNotLike(String value) {
            addCriterion("descripte not like", value, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteIn(List<String> values) {
            addCriterion("descripte in", values, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteNotIn(List<String> values) {
            addCriterion("descripte not in", values, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteBetween(String value1, String value2) {
            addCriterion("descripte between", value1, value2, "descripte");
            return (Criteria) this;
        }

        public Criteria andDescripteNotBetween(String value1, String value2) {
            addCriterion("descripte not between", value1, value2, "descripte");
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