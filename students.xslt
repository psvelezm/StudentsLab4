<?xml version="1.0" encoding="utf-8"?>
<!--This xsl statment designates the stylesheet for the entire xslt format-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <!--This xsl statement designates the output to be formatted in html and to be indented-->
  <xsl:output method="html" indent="yes"/>
  <!--This xsl statement is for the root / default template-->
  <xsl:template match="/">
    <html>
      <head>
        <title>Student Listing</title>
      </head>
      <body>
        <h1>Student Listing</h1>
        <table border="3" cellpadding="3" cellspacing="0">
          <tr style="background-color:yellow">
            <td>ID</td>
            <td>Name</td>
            <td>GPA</td>
            <td>Grade Level</td>
          </tr>
          <!--This xsl statement selects the student template to display information from the student xml file-->
          <xsl:apply-templates select="students/student"/>
          <tr>
            <td colspan="2">Average GPA:</td>
            <td>
              <!--This xsl statement calculates the sum of the gpa attribute and divides it by the number of attributes-->
              <xsl:value-of select="sum(//gpa) div count(//gpa)"/>
            </td>
            <td>&#160;</td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
  <!--This xsl statement is a template statement and is used whenever there is a student match-->
  <xsl:template match="student">
    <tr>
      <td>
        <!--This xsl value of statement will display the id number-->
        <xsl:value-of select="@id"/>
      </td>
      <!--The following xsl value of statements will display the lastname and firstname-->
      <td>
        <xsl:value-of select="lastname"/>,
        <xsl:value-of select="firstname"/>
      </td>
      <!--This xsl choose statement is tied to the when statement and is similar to if else statements. It allows you
     to use consecutive when statement to execute specific conditional commands-->
      <xsl:choose>
        <xsl:when test="gpa &gt;= (3.0)">
          <td style="background-color:#7FFF00">
            <xsl:value-of select="gpa"/>
          </td>
        </xsl:when>
        <xsl:otherwise>
          <td style="background-color:#FF6347">
            <xsl:value-of select="gpa"/>
          </td>
        </xsl:otherwise>
      </xsl:choose>
      <!--<td><xsl:value-of select="gpa"/></td>
    &gt; is equal to greater than, &lt is equal to less than-->
      <td>
        <!--This xsl choose statement is tied to the when statement and is similar to if else statements. It allows you
     to use consecutive when statement to execute specific conditional commands-->
        <xsl:choose>
          <!--xsl when statement is for executing conditional statement-->
          <xsl:when test="@type='grad'">
            <b>Graduate Student</b>
          </xsl:when>
          <xsl:when test="@type='undergrad'">
            <b>Undergraduate Student</b>
          </xsl:when>
        </xsl:choose>
      </td>
    </tr>
    <tr>
      <td colspan="4">
        <!--This xsl statement selects the charges template to display information from the student xml file-->
        <xsl:apply-templates select="charges"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">Total Charges: </td>
      <td colspan="2" style="background-color:#FF1493">
        $
        <!--This xsl value of statement will calculate the sum of all the charges for this specific student-->
        <xsl:value-of select="sum(charges/*)"/>0
      </td>
    </tr>
  </xsl:template>

  <!--This xsl statement is a template statement and is used whenever there is a charges match-->
  <xsl:template match="charges">
    <table>
      <tr colspan="4">
        <b>Charges:</b>
      </tr>
      <tr>
        <td>Tuition:</td>
        <td>
          <!--This xsl value of statement will display the tuition-->
          <xsl:value-of select="tuition"/>
        </td>
      </tr>
      <!--This xsl if statement will only display when the node has an activity attribute-->
      <xsl:if test="self::node()[activity]">
        <tr>
          <td>Activity:</td>
          <td>
            <!--This xsl value of statement will display the actvity fee-->
            <xsl:value-of select="activity"/>
          </td>
        </tr>
      </xsl:if>
      <tr>
        <td>Parking:</td>
        <td>
          <!--This xsl value of statement will display the parking fee-->
          <xsl:value-of select="parking"/>
        </td>
      </tr>
      <tr>
        <td>Health:</td>
        <td>
          <!--This xsl value of statement will display the health fee-->
          <xsl:value-of select="health"/>
        </td>
      </tr>
    </table>
  </xsl:template>

  <!--<xsl:template match="student[lastname='Chong']">
          <tr>
          <td><xsl:value-of select="@id"/></td>
          <td><xsl:value-of select="lastname"/>, 
              <xsl:value-of select="firstname"/>
          </td>
          <td><xsl:value-of select="gpa"/></td>
          <td>
            <b>
              <xsl:value-of select="@type"/>
            </b>
          </td>
        </tr>
  
</xsl:template>
  
<xsl:template match="student[lastname='Jones']">
          <tr>
          <td style="background-color:gray"><xsl:value-of select="@id"/></td>
          <td><xsl:value-of select="lastname"/>, 
              <xsl:value-of select="firstname"/>
          </td>
          <td><xsl:value-of select="gpa"/></td>
          <td>
            <b>
              <xsl:value-of select="@type"/>
            </b>
          </td>
        </tr>
  
</xsl:template>-->

</xsl:stylesheet>
