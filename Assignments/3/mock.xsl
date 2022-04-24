<?xml version = "1.0" encoding = "UTF-8"?> 
<xsl:stylesheet version = "1.0" 
   xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">    
   <xsl:template match = "/"> 
      <html> 
         <body> 
            <h2>Alumini's</h2> 
            <table border = "1"> 
               <tr bgcolor = "lightblue"> 
                  <th>id</th> 
                  <th>name</th> 
                  <th>email</th> 
                  <th>address</th> 
                  <th>contact</th> 
               </tr> 
					
               <xsl:for-each select = "class/alumni"> 
					
                  <xsl:sort select = "name"/> 
                  <tr> 
                     <td><xsl:value-of select = "@id"/></td> 
                     <td><xsl:value-of select = "name"/></td> 
                     <td><xsl:value-of select = "email"/></td> 
                     <td><xsl:value-of select = "address"/></td> 
                     <td><xsl:value-of select = "contact"/></td> 
                  </tr> 
               </xsl:for-each> 
            </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
