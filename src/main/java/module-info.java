module com.nathan.footballsquadmanagerbp2 {
    requires javafx.controls;
    requires java.sql;
    requires java.desktop;
    requires jbcrypt;

    opens com.nathan.footballsquadmanagerbp2.model to javafx.base;
    exports com.nathan.footballsquadmanagerbp2;
}