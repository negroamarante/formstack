/*
 * Sort a list of records by a certain field
 * ASC order will be default
 * Null values will be put at last
 */
public with sharing class SObjectSort implements System.Comparator<sObject> {
  public enum SortOrder {
    ASCENDENT,
    DESCENDENT
  }
  private Schema.sObjectField sortField;
  private SortOrder orden;
  private DescribeFieldResult describeResult;

  public SObjectSort(Schema.sObjectField field, SortOrder ordenParam) {
    if (field == null) {
      throw new SortException('You must provide a field to sort the list');
    }
    if (ordenParam == null) {
      orden = SortOrder.ASCENDENT;
    }

    sortField = field;
    describeResult = field.getDescribe();
    orden = ordenParam;
  }

  public Integer compare(sObject s1, sObject s2) {
    Integer compareResult;

    // Check for null values, put nulls at the end of the list
    if (s1 == null || s2 == null) {
      return (s1 == null && s2 == null) ? 0 : (s1 == null) ? 1 : -1;
    } else {
      Object s1FieldValue = s1?.get(sortField);
      Object s2FieldValue = s2?.get(sortField);

      if (s1FieldValue == null || s2FieldValue == null) {
        return (s1FieldValue == null &&
          s2FieldValue == null)
          ? 0
          : (s1FieldValue == null) ? 1 : -1;
      } else {
        compareResult = compareFieldTypes(s1FieldValue, s2FieldValue);
      }
    }

    if (orden == SortOrder.DESCENDENT) {
      return compareResult * -1;
    }
    return compareResult;
  }

  private Integer compareFieldTypes(object s1FieldValue, object s2FieldValue) {
    switch on (describeResult.getType()) {
      when String {
        String s1 = (String) s1FieldValue;
        String s2 = (String) s2FieldValue;
        return (s1 < s2) ? -1 : (s1 > s2) ? 1 : 0;
      }
      when Datetime {
        DateTime s1 = (DateTime) s1FieldValue;
        DateTime s2 = (DateTime) s2FieldValue;
        return (s1 < s2) ? -1 : (s1 > s2) ? 1 : 0;
      }
      when Double {
        Double s1 = (Double) s1FieldValue;
        Double s2 = (Double) s2FieldValue;
        return (s1 < s2) ? -1 : (s1 > s2) ? 1 : 0;
      }
      // Could add more data types
      when else {
        Assert.fail(
          'Unable to compare field type: ' + describeResult.getType()
        );
      }
    }
    return 0;
  }

  public class SortException extends Exception {
  }
}
