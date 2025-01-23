<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Budget Management</title>
            </head>
            <body>
                <h1>Budget Management</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Expense Name</th>
                            <th>Amount</th>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="budget/expense">
                            <xsl:sort select="amount" data-type="number" order="ascending" />
                            <tr>
                                <td>
                                    <xsl:value-of select="name" />
                                </td>
                                <td>
                                    <xsl:if test="amount &gt; 500">
                                        <strong>
                                            <xsl:value-of select="amount" />
                                        </strong>
                                    </xsl:if>
                                    <xsl:if test="amount &lt;= 500">
                                        <xsl:value-of select="amount" />
                                    </xsl:if>
                                </td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="category='Housing'">
                                            Housing Expense
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="category" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
